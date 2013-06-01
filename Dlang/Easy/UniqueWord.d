module UniqueWord;
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

class UniqueWord
{
	this()
	{
		// Constructor code
		test1();
	}
	//======== TEST1
	void test1() {
		writeln("Hello World!");
		
		// Lets the user press <Return> before program returns
		string input;
		writeln("This program is the classic Fizz Buzz application.");
		writeln("It's more fun to let you play your own way.");
		input = chomp(readln());
		input = absolutePath(input);
		
		assert( input.isFile );
		auto lines = splitLines( readText(input) );
		foreach(line; lines) {
			writeln( getResults(line) );
		}
	}
	string getResults(string line) 
	{
		string[] members = std.regex.split(line, std.regex.regex(" "));
		int A = to!int(members[0]);
		int B = to!int(members[1]);
		int N = to!int(members[2]);
		
		string outputStr;
		/*
	alias Tuple!(int, bool, bool) RuleType;
	auto lazylist = map!(i => i, i => i % A==0, i => i % B==0)( iota(1, N+1, 1) );
	RuleType[] rules = array(lazylist); 

	//(0, false, true), (1, true, true);
	foreach(RuleType rule; rules) {
		if (rule[1]) outputStr ~= 'F';
		if (rule[2]) outputStr ~= 'B';
		else if (!rule[1]) outputStr ~= to!string(rule[0]);
		outputStr ~= " ";
	}

	//outputStr = map!(x => !x[0] && !x[1]? to!string(i) );
*/
		
		foreach(i; 1..N+1) {
			bool isDivzA = (i % A == 0);
			
			//outputStr ~= isDivA?'F':
			if (isDivzA) outputStr ~= 'F';
			if (i % B == 0) outputStr ~= 'B';
			else if (!isDivzA) outputStr ~= to!string(i);
			
			outputStr ~= " ";
		}
		
		
		return outputStr;
	}
	
	/*
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

string getResults(string &fileName, ifstream &file_in);

int main() {


        string fileName, outputStr;

        cout << "This program is the classic Fizz Buzz application.\n";
        cout << "It's more fun to let you play your own way.\n";

        //get file name
        cout << "So please enter the name of the file path that you would like to reference: \n";
        getline(cin, fileName);
        cout << endl;

        //locate and prep to open
        ifstream file_in(fileName.c_str());

        while (!file_in.eof()) {
                outputStr = getResults(fileName, file_in);
                cout << outputStr << endl;
        }
        file_in.close();
        return 0;
}

string getResults(string &fileName, ifstream &file_in) {
        string outputStr;
        if (file_in.good()) {
                int A, B, N;
                string fileText;

                //retrieve A, B and N values
                getline(file_in, fileText, ' ');
                A = stoi(fileText);
                getline(file_in, fileText, ' ');
                B = stoi(fileText);
                getline(file_in, fileText);
                N = stoi(fileText);

                for (int i = 1; i <= N; i++) {
                        bool isDivzA = (i % A == 0);

                        if (isDivzA) outputStr += 'F';
                        if (i % B == 0) outputStr += 'B';
                        else if (!isDivzA) outputStr += to_string(i);
                        outputStr += " ";
                }
        } else outputStr = "Hmm, it seems that the file name you gave does not exist.\n";
        return outputStr;
}
*/
}

