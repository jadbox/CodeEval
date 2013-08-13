// TabbedTable.cpp : Defines the entry point for the console application.
//

#include <iostream>
#include <sstream>
#include <cstdio>
#include <math.h>
using namespace std;

int numDigits(int val) {
	if(val < 10) return 1;
	if(val < 100) return 2;
	if(val < 1000) return 3;
	else return 0;
}

string makeSpaces(int num) {
	string ans=string("");
	for(int i=0; i < num; i++) ans.append(" ");
	return ans;
}

int main()
{
	int padspaces = 4;
	int digits=0;
	for(int x = 1; x < 13; x++) {
		for(int y = 1; y < 13; y++) {
			int answer = (y*x);
			
			//if(y==2) digits = numDigits(answer) + digits - 1;
			digits = numDigits(answer);
			
			string spaces;
			if(y != 1) spaces = makeSpaces(padspaces - digits);
			cout << spaces << answer;
		}
		cout << endl;
	}

	int i=0;
	cin >> i;
	return 0;
}

