module HexToDec;

import std.math;
import std.stdio;
import std.conv;
import std.algorithm;
import std.array;

struct Hex {
	string str;
}
class HexToDecimal
{
	this()
	{
		Hex hval = Hex("9f"); //159
		
		int hexAns = hexToInt_v2(hval);
		writeln(to!string(hexAns));
		
		// Lets the user press <Return> before program returns
		stdin.readln();
	}

	int hexToInt_v2(Hex hex) {
		// 2f3 = > 2*16^2 + 15*16^1 + 3*16^0
		int offset(int c) {
			if(c >= '0' && c <= '9') return c - '0';
			else return c - 'a' + 10;
		}
		//===
		int algo(int a) {
			static int i = 0;
			return a*pow(16, i++);
		}
		//===
		auto hexInts = map!offset(hex.str).array().reverse; // "f9" => 15, 9 => 9, 15
		auto ansList = map!(algo)(hexInts);
		auto ans = reduce!("a+b")(ansList); 
		return ans;
	}
	
	
	int hexToInt(Hex hex) {
		int answer = 0;
		int stepv = 0;
		auto i = hex.str.length-1;
		
		foreach(c; hex.str) {
			if(c >= '0' && c <= '9') stepv = c-'0';
			else stepv = c - 'a' + 10;
			answer += stepv * pow(16, i);
			i--;
		}
		return answer;
	}
}	
	/*
unittest {
	int[] test = [1,2,3];
	string result="";
	//result = reduce!("a+b+1")(test);
	writeln("=="~result);

	assert( equal(getInts("1,2,3 "),[1,2,3]), "Comma string list to int list check" );
	assert( equal(getInts("1 2 3 "),[1,2,3]), "Space seperated string list to int list check");
}

void findSqImp() {
	int[] list = getInts("2 0 6 3 1 6 3 1 6 3 11 ");
	findSq(list);
	
	//auto event = new Event();
	//event.day = 22;
}
void findSq(int[] list) {
	int rampDir = -2;
	int last;
	string builder="";

	foreach(val; list) {
		switch(rampDir) {
			case 0: {
				rampDir = last < val?1:last > val?-1:0;
				last = val;
				break;
			}
			case -2: {
				last = val;
				rampDir = 0;
				break;
			}
			case 1: if(last > val) {last=val; rampDir=-2; builder ~= '\n';}
			case -1: if(last < val) {last=val; rampDir=-2; builder ~= '\n';}
			default:
		}
		 builder ~= to!string(val) ~ ",";
	}
	writeln(builder);
}

int[] getInts2(in string input) {
	int[] list = [];
	return list;
}

int[] getInts(in string input) {
	string current = "";
	int[] list = [];
	list.reserve(input.length);
	list.length = 22;
	int i = 0;
	foreach(c; input) {
		if(c!= ' ' && c!=',') current ~= c;
		else {
			//writeln("="~current~"=");
			int val = to!int(current);
			current = "";
			list[i++] = val;
		}
	}
	list.length = i;
	return list;
}


void test() {
	string input = "cat";
	string[] results;
	results.reserve(input.length * input.length);
	int ci = 0;
	for (int i = 0; i < input.length; i++) {
		char c = input[i];
		string cpy = input[0..i] ~ input[i+1..$];
		for (int t = 0; t < cpy.length; t++) {
			string item = cpy[0..t] ~ c ~ cpy[t..$];
			
			results[ci++] = item;
		}
		results[ci++] = cpy[0..$] ~ c;
	}
	
	bool[string] dcheck;
	for (int z = 0; z < ci; z++) {
		dcheck[ results[z] ] = true;
	}
	
	foreach(result; dcheck.keys.sort) {
		writeln(result);
	}
}
*/
	/*
class Event {
	int day=1;
	int hour=1;
	bool isAM=true;

	int addDay(int i) {
		day+=1;
		return day;
	}

	invariant() {
		assert(1 >= day && day <= 31);
		assert(1 >= hour && hour <= 12);
	}

	unittest { 
		Event event = new Event; 

		event.day = 50;
		event.addDay(1);
		assert(event.day==51);

		assert(event); 
	}
}
*/
	



