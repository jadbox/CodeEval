module main;

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
import UpperFile;
import LineSum;

//import std.regex;

void main(string[] args)
{
	// Prints "Hello World" strig in console
	//UpperFile.readFile("text.txt");
	//LineSum.sumFile("lineNumbers.txt");
	auto result = LineSum.totalSumFile("lineNumber.txt");

	writeln(result);
}



