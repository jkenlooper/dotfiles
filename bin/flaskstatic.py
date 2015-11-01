#!/usr/bin/env python
import os

from werkzeug.serving import run_simple
from flask import Flask, send_from_directory
from livereload import Server, shell

app = Flask(__name__, static_url_path=os.getcwd())
#app.debug = True

@app.route('/')
def root():
    return app.send_static_file('index.html')

@app.route('/<path:filename>')
def send_it(filename):
    return send_from_directory(os.getcwd(), filename)


if __name__ == '__main__':
    server = Server(app)

    # The `.livereload` file triggers a livereload if it is modified.
    server.watch('.livereload')

    server.serve(
            host=app.config.get("HOST", '127.0.0.1'),
            port=app.config.get("PORT", 4444)
            )
