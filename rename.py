#!/usr/bin/env python

import os
import glob
import subprocess
from os.path import *
import re


def rename(p):
   f=file(p)
   buffer=f.read()
   f.close()
   for i in renames:
       buffer=buffer.replace(i[0],i[1])

   f=file(p+".ads","w")
   f.write(buffer)
   f.close()

   print subprocess.call(["gnatchop","-gnat05","-w" , p + ".ads","src/gen"])

matcher=re.compile("^(.+)\\=>(.*)")
f=file("renames.txt")
renames=[]
for line in f:
   matches=matcher.match(line)
   if matches:
     if line[0] != "#" and line[0:1] != "--":
	renames.append([matches.group(1).strip() ,matches.group(2).strip()])

for i in glob.glob(".gen/openssl*_h.ads"):
   rename(i)
