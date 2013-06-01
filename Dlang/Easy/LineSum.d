module LineSum;
import std.file;
import std.stdio;
import std.conv;
import std.array;
import std.algorithm;
import std.string;

void sumFile(const string fileName) {
	const auto fileTxt = splitLines( std.file.readText(fileName) ); // parse lines: ["1 2", "1 2 3"]
	auto lineSumTxt = sumLines(fileTxt); //sum all the lines;
	foreach(line; lineSumTxt) writeln( line ); // output
}

const string[] sumLines(const string[] fileTxt) {
	auto lineSumVals = map!(sumLine)( fileTxt ); // [3, 6]
	return array(lineSumVals);
}

const string sumLine(const string line) {
	const auto members = std.regex.split(line, std.regex.regex(" ")); // split the line: ["1", "2"]
	auto lineVals = map!(to!int)(members); // cast each element to int: ["1", "2"] => [1, 2]
	const int ans = reduce!"a+b"(lineVals); // reduce: [1, 2] => 3
	return to!string(ans);  // to String
}

// === CodeEval.com: Sum lines by file
const int totalSumFile(const string fileName) {
	const auto fileTxt = splitLines( readText(fileName) ); // parse lines: ["5", "12"]
	auto lineVals = map!(to!int)(fileTxt); // cast each element to int: ["5", "12"] => [5, 12]
	return reduce!"a+b"(lineVals);
}

unittest {
	assert( sumLine("1 2") == "3" );
	assert( sumLine("1 2 3") == "6" );
	assert( sumLine("44") == "44" );
	assert( equal(sumLines(["1 2", "1 2 3"]), ["3","6"]) ); 
	writeln("==unit tests finished==");
}