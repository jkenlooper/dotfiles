#!/usr/bin/env -S sh -o errexit

rm -rf dist
python -m venv .venv
. .venv/bin/activate
python -m pip install -e .
python -m pip install twine
python -m pip install build
python -m build --sdist --wheel
twine check dist/*

echo "
Upload to PyPI? [y/n]
"
confirm="n"
read -r confirm
if [ "$confirm" = "y" ]; then
  twine upload dist/*
fi
