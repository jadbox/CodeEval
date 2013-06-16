module BlackJack;
import std.traits;
import std.stdio;
import std.conv;
import std.array;
import std.math;
import std.algorithm;

class BlackJack
{
	struct Player {
		int score=0;
		Card[] hand;
		ref Player add(Card c) {
			hand ~= c;
			score += c.val;
			return this;
		}
	};
	Player dealer, user;
	struct Card {
		CardSuit suit;
		CardType name;
		AceVal aceval=AceVal.NIL; // For ace
		@property int val() {
			if(name==CardType.ACE) return aceval;
			return std.algorithm.min(name, 10);
		}
	}
	enum AceVal:int { NIL=0, LOW = 1, HIGH = 11 }
	enum CardType : int {
		TWO=2, THREE, ACE=11 //FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, QUEEN, JACK, KING, 
	}
	enum CardSuit {
		Spades, Hearts, Diamonds, Clubs
	}

	Card[] deck;
	this()
	{
		// make deck
		reset();
		//auto ideck2 = std.random.RandomCover([1,2,3], std.random.rndGen); 
	} 
	public void play() {
		user.add(tellDraw()).add(tellDraw());
		while(true) {
			writeln("Total: ", user.score);
			writeln("Draw card (y/n)?");
			auto c = std.stdio.readln()[0];
			if(c!='y') break;
			user.add(tellDraw());
		}
		// Dealer draws
		do {
			writeln("Dealer draws");
			dealer.add( draw() );
		} while(dealer.score < 12);

		// resolve aces
		AceVal plogic(ref Card c) {
			writeln("Set Ace to (h)igh or (l)ow?");
			auto ap = std.stdio.readln()[0];
			if(ap=='l') return AceVal.LOW;
			else if(ap=='h') return AceVal.HIGH;
			else return AceVal.NIL;
		}
		resolveAces(&plogic, user);
		// ace check for computer
		AceVal dlogic(ref Card c) {
			return dealer.score <= 21-11?AceVal.HIGH:AceVal.LOW;
		}
		resolveAces(&dlogic, dealer);
		//======
		writeln("==== Dealers Hand ====");
		foreach(ref c; dealer.hand) writeln("Dealer has a ",c.name," of ",c.suit," value:",c.val);
		writeln("=======================");
		writeln("Player: ",user.score," :: Dealer: ", dealer.score);

		if(user.score > dealer.score && user.score < 22) {
			writeln("You win!");
		} else {
			writeln("You lose.");
		}
	}
	// Calls the delegate for each ace
	void resolveAces(AceVal delegate(ref Card) fun, ref Player player) {
		auto aces = filter!(c => c.name==CardType.ACE)(player.hand);
		foreach(ref c; aces) {
			do {
				c.aceval = fun(c);
			} while (c.aceval == AceVal.NIL); 
			player.score+=c.val;
		}
	}

	public void reset() {
		user = Player();
		dealer = Player();
		auto types = [ EnumMembers!CardType ];
		auto suits = [ EnumMembers!CardSuit ];
		//deck.reserve(types.length * suites.length);
		for(uint i = 0; i < types.length; i++) 
			for(uint j = 0; j < suits.length; j++) 
				deck ~= Card(suits[j], types[i]);
		//===
		std.random.randomShuffle(deck);
	}
	Card tellDraw(string who="You") {
		auto c = draw();
		writeln(who ~ " draw a: ",c.name," of ",c.suit);
		return c;
	}

	Card draw() {
		auto c = deck.front;
		deck.popFront();
		return c;
	}
}

