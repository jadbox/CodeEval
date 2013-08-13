#pragma once
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;

class FizzBuzz
{
public:
	FizzBuzz(int argc, char* argv[]) {
		ifstream openFile;
	openFile.open(argc==1?"ch1.txt":argv[1]);
	while(openFile.good() ) {
		string a;
		getline(openFile, a);
		if(a.length()==0) continue;
		cout << fizzBuzzString(a) << endl;
	}
	openFile.close();
	}

private:
	string fizzBuzzString(string line) {
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
};

int main_fb_alt(int argc, char* argv[])
{
	FizzBuzz fz (argc, argv);
	return 0;
}