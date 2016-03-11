import std.stdio: writeln;
import std.getopt: getopt;
import std.file: DirEntry, dirEntries, SpanMode, FileException;
import std.string: endsWith, format, startsWith;
import std.regex: regex, replaceAll;
import std.parallelism;
import std.path: baseName;

import common;

void main(string[] args) {
  string regexStr;
  string[] directories = [];
  getopt(args,
      "dir", &directories,
      "regex",  &regexStr);

  bool search(R)(R r) {
    bool foundMatch = false;
    foreach (string dir; directories) {
      try {
        foreach (DirEntry fileEntry; dirEntries(dir, SpanMode.breadth)) {
          if (fileEntry.name.matches(fileTypeRegex)
              && baseName(fileEntry.name).matches(r)) {
            writeln(fileEntry.name);
            foundMatch = true;
          }
        }
      } catch (FileException e) {
        // Ignore invalid dirs
      }
    }
    return foundMatch;
  }

  auto r = regex(regexStr, "i");
  bool foundMatch = search(r);
  if (!foundMatch) {
    // Try making it snake case
    r = regex(replaceAll(regexStr, regex("(.)([A-Z])"), "$1_$2"), "i");
    search(r);
  }
}
