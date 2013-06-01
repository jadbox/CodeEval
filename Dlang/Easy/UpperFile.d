module UpperFile;

import std.stdio;
import std.file;
import std.path;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.typetuple;
import std.typecons;

void readFile(string fileName) 
{
	auto input = readText(fileName);
	auto output = map!(std.uni.toLower)(input);
	writeln(output);
}

