#!/usr/bin/env python
import os

from werkzeug.serving import run_simple
from flask import Flask, send_from_directory

app = Flask(__name__, static_url_path=os.getcwd())
#app.debug = True

@app.route('/')
def root():
    return app.send_static_file('index.html')

@app.route('/<path:filename>')
def send_it(filename):
    return send_from_directory(os.getcwd(), filename)


if __name__ == '__main__':

    run_simple('localhost', 4444, app, use_reloader=True, threaded=True, processes=1)
