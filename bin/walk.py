#!/usr/bin/env python
"""walk - compare two directories

Usage: walk DIRECTORY ...
       walk --help

Options:
  -h --help         Show this screen.
"""
import os
import sys

from docopt import docopt


def main(dir1, dir2):
    dir1_files = set()
    dir2_files = set()
    print dir1, dir2

    for root, dir, files in os.walk(dir1):
        for f in files:
            dir1_files.add(os.path.join(root[len(dir1)+1:], f))

    for root, dir, files in os.walk(dir2):
        for f in files:
            dir2_files.add(os.path.join(root[len(dir2)+1:], f))

    print len(dir1_files)
    print len(dir2_files)
    for d in dir1_files.difference(dir2_files):
        print d
    print "---"
    for d in dir2_files.difference(dir1_files):
        print d

if __name__ == '__main__':
    args = docopt(__doc__)
    main(*sys.argv[1:])
