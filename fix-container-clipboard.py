#!/usr/bin/python

# try this one with auto copy into clipboard
# python 2.py file_name | xclip

import json
import sys
import fileinput
from shutil import copyfile

f = "/tmp/test.json"
copyfile(sys.argv[1], f)

with open(f) as json_file:
    content = json.load(json_file)

c1 = 100
c2 = 20
r = {"ids":{}, "cids":{}}
for d in content:
    newid = id = d["id"]
    newcid = cid = d["cid"]
    if id > c1:
        newid = c1
        c1 += 1
        r["ids"][id] = newid
    if cid not in r["cids"] and cid > c2:
        newcid = c2
        c2 += 1
        r["cids"][cid] = newcid

with fileinput.FileInput(f, inplace=True) as file:
    for line in file:
        l=line
        for k, v in r["ids"].items():
            l = l.replace(f":{str(k)},", f":{str(v)},")
        for k, v in r["cids"].items():
            l = l.replace(f":{str(k)},", f":{str(v)},")
        print(l, end='')

with open(f) as json_file:
    print(json_file.read())
