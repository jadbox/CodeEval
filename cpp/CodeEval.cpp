// CodeEval.cpp : Defines the entry point for the console application.
//
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;

string fizzBuzz(string data);

int main(int argc, char* argv[])
{
	ifstream openFile;
	openFile.open(argc==1?"ch1.txt":argv[1]);
	while(openFile.good() ) {
		string a;
		getline(openFile, a);
		if(a.length()==0) continue;
		cout << fizzBuzz(a) << endl;
	}
	openFile.close();
	
	return 0;
}
string fizzBuzz(string line) {
	int a,b,n;
	std::istringstream iss(line); 
	iss >> a;
	iss >> b;
	iss >> n;

	string result;
	for(int i=1; i <= n; i++) {
		bool ad = i%a==0;
		if(ad) result +='F';
		if(i%b==0) result +='B';
		else if(!ad) {
			ostringstream oss;
			oss << i;
			result += oss.str();
		}
		result += " ";
	}
	return result;
}

