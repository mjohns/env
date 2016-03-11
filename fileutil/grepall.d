import std.stdio;
import std.getopt;
import std.file: DirEntry, dirEntries, SpanMode, isDir, FileException;
import std.string: endsWith, format;
import std.regex;
import std.parallelism;

import common;

void main(string[] args) {
  string regexStr;
  string[] directories = [];
  getopt(args,
      "dir", &directories,
      "regex",  &regexStr);

  auto r = regex(regexStr, "i");
  Task!(grepFile, string, Regex!char)*[] tasks;
  foreach (string dir; directories) {
    try {
      foreach (string fileName; dirEntries(dir, SpanMode.breadth)) {
        if (!fileName.isDir && fileName.matches(fileTypeRegex)) {
          auto t = task!grepFile(fileName, r);
          taskPool.put(t);
          tasks ~= t;
        }
      }
    } catch (FileException e) {
      // Ignore invalid dirs
    }
  }

  taskPool.finish(true);
  foreach (t; tasks) {
    foreach (string line; t.yieldForce) {
      write(line);
    }
  }
}

string[] grepFile(string fileName, Regex!char r) {
  string[] matches;

  auto file = File(fileName, "r");
  string line;
  int lineNum = 1;
  while ((line = file.readln()) !is null) {
    scope (exit) lineNum++;
    if (line.matches(r)) {
      matches ~= format("%s:%d   %s", fileName, lineNum, line.endsWith("\n") ? line : line ~ "\n");
    }
  }

  return matches;
}
