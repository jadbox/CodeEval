module BlackJack;
import std.traits;
import std.stdio;
import std.conv;
import std.array;
import std.math;

class BlackJack
{
	struct Card {
		CardSuit suit;
		CardType name;
		@property int val() {
			return std.algorithm.min(to!int(name), 10);
		}
	}
	enum CardType : int {
		TWO=2, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, QUEEN, JACK, KING, ACE 
	}
	enum CardSuit {
		Spades, Hearts, Diamonds, Clubs
	}

	Card[] deck;
	//Card[] ideck;
	Card[] phand;
	Card[] dhand;
	this()
	{
		// make deck
		reset();
		//auto ideck2 = std.random.RandomCover([1,2,3], std.random.rndGen); 
	} 
	public void play() {
		phand ~= tellDraw();
		phand ~= tellDraw();
		
		int ptotal = total(phand);
		while(true) {
			writeln("Total: " ~ to!string(ptotal));
			writeln("Draw card (y/n)?");
			auto c = std.stdio.readln()[0];
			if(c!='y') break;
			phand ~= tellDraw();
			ptotal += phand.back.val; 
		}
		// Dealer draws
		int dtotal = 0;
		do {
			writeln("Dealer draws");
			dhand ~= draw();
			dtotal += dhand.back.val;
		} while(dtotal < 12);
		
		writeln("Player: " ~ to!string(ptotal) ~ " :: Dealer: " ~ to!string(dtotal));
		
		if(ptotal > dtotal && ptotal < 22) {
			writeln("You win!");
		} else {
			writeln("You lose.");
		}
	}
	public void reset() {
		phand = [];
		dhand = [];
		auto types = [ EnumMembers!CardType ];
		auto suits = [ EnumMembers!CardSuit ];
		int step = suits.length;
		//deck.reserve(types.length * suites.length);
		for(uint i = 0; i < types.length; i++) 
			for(uint j = 0; j < step; j++) 
				deck ~= Card(suits[j], types[i]);
		//===
		std.random.randomShuffle(deck);
		//foreach(c; deck) writeln(to!string(c.suit));
	}
	static int total(Card[] list) {
		int vals;
		foreach(c; list) vals += c.val;
		return vals;
	}
	Card tellDraw(string who="You") {
		auto c = draw();
		writeln(who ~ " draw a: " ~ to!string(c.name) ~ " of " ~ to!string(c.suit));
		return c;
	}

	Card draw() {
		auto c = deck.front;
		deck.popFront();
		return c;
	}
}

