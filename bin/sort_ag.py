#!/usr/bin/python3

import os
import select
import sys
import functools

lines = []

for line in sys.stdin:
  lines.append(line)

def get_file_name(full):
  index = full.index(":")
  return full[0:index]

def sorter(lhs, rhs):
  lhs = get_file_name(lhs)
  rhs = get_file_name(rhs)
  if lhs < rhs:
    return -1
  if lhs == rhs:
    return 0
  return 1


sorted_lines = sorted(lines, key=functools.cmp_to_key(sorter))

for line in sorted_lines:
  sys.stdout.write(line)
