#!/usr/bin/env python
# -*- encoding: utf-8 -*-
import re
import sys

def process_smi(content, millisec):
  pattern = re.compile(r"<sync[^<^>]*start=[\'\"]?(\d+)[\'\"]?[^<^>]*>", re.IGNORECASE)

  index = 0
  while True:
    sync = pattern.search(content, index)
    if not sync:
      break

    total = sync.group(0)
    start = int(sync.group(1))

    fixed_start = start + millisec if start + millisec > 0 else 0
    total = total.replace(str(start), str(fixed_start))

    content = content[:sync.start()] + total + content[sync.end():]
    index = sync.end() + len(str(fixed_start)) - len(str(start))

  return content

def main(argv):
  if len(argv) != 4:
    print "Wrong argv."
    print "./smi-editor.py (file) (encoding) (millisecond)"
    return

  smi_file = open(argv[1])
  encoding = argv[2]
  millisec = int(argv[3])

  result = process_smi(smi_file.read().decode(encoding), millisec)

  smi_file.close()

  # write
  smi_file = open(argv[1], 'w')
  smi_file.write(result.encode(encoding))
  smi_file.close()

if __name__ == "__main__":
  main(sys.argv)
