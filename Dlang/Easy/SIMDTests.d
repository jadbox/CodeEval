module SIMDTests;
import core.simd;
import std.array;
import std.stdio;
import std.datetime;

class SIMDTests
{
	immutable int SAMPLE_AT=20000;
	immutable int RUNS = 3;
	this()
	{
		writeln("==SIMD==");
		for(int i=0; i < RUNS;  i++) testSIMD();
		writeln("==SCALAR==");
		for(int i=0; i < RUNS;  i++) testScalar();
	} 

	//==== SIMD
	public float4 d[SAMPLE_AT];
	void testSIMD() { 
		d[] = [1.4f, 2f, 5f, 1f];

		auto hn = Clock.currStdTime();
		float4 _iv = [.1f, .9f, 1.01f, 9f];
		float4 _dv = [2.1f, 2.1f, 1.01f, 2.1f];

		float4* di;
		for(int i=0; i < SAMPLE_AT;  i++) {
			di = &d[i];
			*di *= _iv; 
			*di *= _dv;
		}
		auto c = Clock.currStdTime() - hn;
		writeln("hnsecs: ", c);
		//writeln( d[0].array[0] );
	}

	//==== SCALAR
	alias float[4] Sfloat4;
	public Sfloat4[SAMPLE_AT] g;
	void testScalar() {
		g[] = [1.4f, 2f, 5f, 1f];
		auto hn = Clock.currStdTime();
		Sfloat4* gi;
		for(int i=0; i < SAMPLE_AT;  i++) {
			gi = &g[i];
			(*gi)[0] *= .1f; 
			(*gi)[1] *= .9f; 
			(*gi)[2] *= 1.01f; 
			(*gi)[3] *= 9f;
			
			(*gi)[0] *= 2.1f; 
			(*gi)[1] *= 2.1f; 
			(*gi)[2] *= 1.01f; 
			(*gi)[3] *= 2.1f;
		}

		auto c = Clock.currStdTime() - hn;
		writeln("hnsecs: ", c);
	}
}

