# Kata: the game of Three Men's Morris

This is my worked example from the 28th meeting of the London Code Dojo. Feel free to play around with it. 

You can find a [Node.js](https://nodejs.org/en/) and [CoffeeScript](http://coffeescript.org/) implementation of the kata in the [coffee](coffee) folder.

The source of the kata is the ancient game of Three Men's Morris, similar to Noughts and Crosses, of which you can find out more [here](http://en.wikipedia.org/wiki/Three_Men%27s_Morris).
You can find out more about the London Code Dojo at our [homepage](http://www.meetup.com/London-Code-Dojo/).

# 
# Three Men's Morris
## History

The game of [Three Men's Morris](https://en.wikipedia.org/wiki/Three_Men%27s_Morris), similar to `Noughts and Crosses` or `Tic-Tac-Toe` is known alternately as:

* "Terni Lapilli" or "Three Stones" in Roman times
* "Tapatan" in the Philippines
* "Luk Tsut K'i" ('six man chess') in China

The earliest known boards date from 1400 BCE, carved into the roof tiles in the Temple of Seti I in Kurna, Egypt. There are similar games found in most ancient cultures, the modern Noughts and Crosses or Tic-Tac-Toe is a simpler variation.

Boards have been found carved into cloister seats in many English cathedrals:  Canterbury, Gloucester, Norwich, Salisbury and Westminster Abbey - so popular was it that there is some evidence that it was outlawed amongst the clergy in medieval times. The word 'Morris' here is not the same 'Morris' as from 'Morris Dancing' (which derives from 'Moorish' - the medieval culture of north-west Africa) but instead comes from the Latin word 'Merellus', which means a counter or gaming piece.

The objective of the game is to get your three counters in a row, either horizontally, vertically or diagonally.

## The board

The board is a three row, three column grid with nine spaces for players' counters to go:

	o-o-o
	|\|/|
	o-o-o
	|/|\|
	o-o-o

## Game play

* There are two players, white and black.
* As in the game of Chess, the white player moves first.
* Players may choose any method they like to determine who plays white and who plays black.
* Each player has three pieces of their own colour.
* Each player takes it in turns to place a piece.
* If a player has placed all three of their pieces, then they must pick up one of their already placed pieces and move it to a vacant space, either horizontally, vertically or diagonally.
* A piece cannot be replaced in its original place, nor may it be placed on an opponents piece.
* As soon as a player places a piece that gives them a row of three, either horizontally, vertically or diagonally, they have won.

## Objective

Write an application that enables two players to play Three Men's Morris on a computer. No GUI is needed, but a primitive command-line display similar to the above would be helpful for the players. 

# License
The code samples are licensed under the CC-SA-NC-4.0 license, as shown in the [LICENSE](/LICENSE) file.
