#!/usr/bin/env python
"""chill-livereload.py - script to run livereload chill

Usage: chill-livereload.py [--config <file>]
       chill-livereload.py --help

Options:
    -h --help         Show this screen.
    --config <file>   Set config file. [default: ./site.cfg]

This works a lot like the `chill run` command but includes the livereload bit.
"""
from docopt import docopt
from chill.app import make_app
from livereload import Server, shell
import formic


def run_livereload(config):
    "Run app in foreground. don't use for production"
    app = make_app(config=config)

    server = Server(app)

    # TODO: The command to build a site's resources will probably be different.
    # Just using `make` here as it's pretty generic.
    fileset = formic.FileSet(include="**")
    for filename in fileset:
        server.watch(filename, 'make')

    server.serve(
            host=app.config.get("HOST", '127.0.0.1'),
            port=app.config.get("PORT", 5000)
            )

def main():
    ""
    args = docopt(__doc__)

    run_livereload(args['--config'])

if __name__ == '__main__':
    main()
