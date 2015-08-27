#!/usr/bin/env python
"""chill-upload-rackspace - Upload frozen directory to rackspace cloudfiles

Usage: chill-upload-rackspace [--config <file>]
       chill-upload-rackspace --help

Options:
  -h --help         Show this screen.
  --config <file>   Set config file. [default: ./site.cfg]

Upload and Sync the 'frozen' directory (FREEZER_DESTINATION) to rackspace
cloudfiles.  Sets it up to be a static website. This will delete any files on
remote that are not in the local folder. (This deletion of files is not
immediate)

The site.cfg is the same as the one in use by Chill.  Add the following
settings to it:

# The credential file should set the api_key and username under the
# [rackspace_cloud] section
RACKSPACE_CREDENTIAL_FILE = "/path/to/config"

# While it makes sense to name this as the domain name; it's not
# necessary to.
RACKSPACE_CONTAINER_NAME = "www.example.com"

FREEZER_DESTINATION = "frozen"
"""

import os

from flask import Config
from docopt import docopt
import pyrax

# Number of seconds to wait before an object is deleted. TTL still applies,
# however.  This delay is useful when doing a longer upload/sync and to avoid
# having objects not found.
DELETE_OBJECTS_DELAY = 900
INDEX_PAGE = 'index.html'
ERROR_PAGE = '404.html'

# CDN TTL in seconds. Lowest is 900
TTL = 900

def main(argconfig):
    # Load the config file the same way Flask does which Chill uses.
    config_file = argconfig if argconfig[0] == os.sep else os.path.join(os.getcwd(), argconfig)
    config = Config(os.getcwd())
    config.from_pyfile(config_file)

    pyrax.set_credential_file(config['RACKSPACE_CREDENTIAL_FILE'])
    cf = pyrax.cloudfiles

    # sync sync_folder_to_container
    local = config['FREEZER_DESTINATION']
    container_name = config.get('RACKSPACE_CONTAINER_NAME', os.path.basename(os.getcwd()))

    prefix = config.get('PUBLIC_URL_PREFIX', None)
    if prefix:
        for page in (INDEX_PAGE, ERROR_PAGE):
            # If no index.html or 404 then link to the one found in
            # PUBLIC_URL_PREFIX
            if not os.path.exists(os.path.join(local, page)):
                print "Creating hard link for {0}".format(page)
                print "{0} -> {1}".format(os.path.join(local, page), os.path.join(local, prefix[1:], page))
                os.link(os.path.join(local, prefix[1:], page), os.path.join(local, page))

    confirm = raw_input("\nsync the folder: {local} \nto rackspace cloudfiles container: {container_name}\n[n]/y\n".format(**locals()))
    if confirm != 'y':
        return

    remote = cf.create_container(container_name)

    local_files = set()
    for root, dir, files in os.walk(local):
        for f in files:
            local_files.add(os.path.join(root[len(local)+1:], f))

    cf.sync_folder_to_container(local, remote)

    # Mark all objects on remote to be deleted if not in local
    # The limit here is arbitrary, but can not be higher then 10000.
    limit = 1000
    marker = ""
    remote_objects_list = remote.get_objects(limit=limit, marker=marker)
    while remote_objects_list:
        marker = remote_objects_list[-1].name
        for obj in remote_objects_list:
            if obj.name not in local_files:
                obj.delete_in_seconds(DELETE_OBJECTS_DELAY)

        remote_objects_list = remote.get_objects(limit=limit, marker=marker)

    # publish
    cf.make_container_public(container_name, ttl=TTL)

    # cdn website
    remote.set_web_index_page(INDEX_PAGE)
    remote.set_web_error_page(ERROR_PAGE)

    # Totally copied from the docs
    print
    print "After Making Public"
    print "cdn_enabled", remote.cdn_enabled
    print "cdn_ttl", remote.cdn_ttl
    print "cdn_log_retention", remote.cdn_log_retention
    print "cdn_uri", remote.cdn_uri
    print "cdn_ssl_uri", remote.cdn_ssl_uri
    print "cdn_streaming_uri", remote.cdn_streaming_uri
    print "cdn_ios_uri", remote.cdn_ios_uri


if __name__ == '__main__':
    args = docopt(__doc__)
    main(args['--config'])
