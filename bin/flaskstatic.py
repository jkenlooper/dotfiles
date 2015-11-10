#!/usr/bin/env python
import os

from werkzeug.serving import run_simple
from flask import Flask, send_from_directory, render_template_string, abort
from livereload import Server, shell

app = Flask(__name__, static_url_path=os.getcwd())
app.debug = True
CWD = os.getcwd()

directory_listing = """
<a href="/{{ updirectory }}">
/{{ updirectory }}
</a><br>
{{ directory }}<br>
{% for file in files %}
    <a href="{{ directory }}{{ file }}">{{ file }}</a><br>
{% endfor %}
"""

@app.route('/', defaults={'filename': ''})
@app.route('/<path:filename>')
def send_it(filename):
    absolute_filepath = os.path.join(CWD, filename)

    if not os.path.exists(absolute_filepath):
        return abort(404)

    if os.path.isfile(absolute_filepath):
        return send_from_directory(CWD, filename)

    files = os.listdir(absolute_filepath)
    directory = os.path.join('/', absolute_filepath[len(CWD)+1:])
    if directory != '/':
        directory = directory + '/'
    updirectory = os.path.dirname(absolute_filepath[len(CWD)+1:])

    return render_template_string(directory_listing, files=files, directory=directory, updirectory=updirectory)


if __name__ == '__main__':
    server = Server(app)

    # The `.livereload` file triggers a livereload if it is modified.
    server.watch('.livereload')

    server.serve(
            host=app.config.get("HOST", '127.0.0.1'),
            port=app.config.get("PORT", 4444)
            )
