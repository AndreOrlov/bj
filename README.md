### Blackjack in Ruby (CLI)
-----

This is an implementation of Blackjack in Ruby with the following house rules:

  * Blackjack wins 3:2
  * Dealer stands at 17
  * Double-down only on first two cards
  * Double-down limited to 100% of bet
  * Splits allowed on same value cards
  * Resplits allowed up to 4 hands

### Running
* Clone this repo into a folder `bj`
* Install gems
<pre>
    $> cd bj
    bj> bundle install
</pre>
* To run tests
<pre>
    $> cd bj
    bj> rspec ./spec
</pre>
* To run the game
<pre>
    $> cd bj
    bj> ruby src/bj.rb
</pre>

### Requirements
Implement a simple game of blackjack. It should employ a basic command-line interface. The program should begin by asking how many players are at the table, start each player with $500, and allow the players to make any integer bet for each deal.

The program must implement the core blackjack rules, i.e. players can choose to hit until they go over 21, the dealer must hit on 16 and stay on 17, etc. It must also support doubling-down and splitting.

### Demo
https://repl.it/MaKj/1