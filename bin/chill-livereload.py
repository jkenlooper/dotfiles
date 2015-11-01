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


def run_livereload(config):
    "Run app in foreground. don't use for production"
    app = make_app(config=config)

    server = Server(app)

    # The command to build a site's resources will probably be different.  The
    # `.livereload` file triggers a livereload if it is modified.
    server.watch('.livereload')

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
