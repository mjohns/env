import std.regex;
import std.algorithm.iteration: map;
import std.conv: text;
import std.string: join;

private immutable fileTypes = [
    "java", "borg", "proto", "cc", "h", "hh", "html", "soy", "mm", "m",
    "go", "js", "gcl", "gss", "css", "c\\+\\+", "d", "py", "txt", "tc", "gyp", "blueprint"
];
enum fileTypeRegex = ctRegex!(text(join(map!(f => "\\." ~ f ~ "$")(fileTypes), "|")) ~ "|BUILD");

bool matches(R)(string s, R regex) {
  return !matchFirst(s, regex).empty;
}
