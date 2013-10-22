Code Dojo 28
============
This is my worked example from the 28th meeting of the London Code Dojo. Feel free to play around with it. I've used Node.js and CoffeeScript with the Mocha testing library and the Chai assertion library.

The tests can be run from the command-line with [mocha](http://visionmedia.github.io/mocha/):
	
	mocha --compilers coffee:coffee-script -R spec test-*.coffee

You can also use this with the **-w** flag to have mocha watch for file changes and re-run the tests (this obviates the need for watchr or similar tools).

The source of the kata is the ancient game of Three Men's Morris, similar to Noughts and Crosses, of which you can find out more [here](http://en.wikipedia.org/wiki/Three_Men%27s_Morris). 
You can find out more about the London Code Dojo at our [homepage](http://www.meetup.com/London-Code-Dojo/).

Kata: the game of Three Men's Morris
----
Known as 'Terni Lapilli' or 'three stones' in Roman times.
'Tapatan' in the Philippines
"Luk Tsut K'i" ('six man chess') in China
The earliest known boards date from 1400 BCE, carved into the roof tiles in the Temple of Seti I in Kurna, Egypt. 
There are similar games found in most ancient cultures, the modern Noughts and Crosses or Tic-Tac-Toe is a simpler variation.

Boards have been found carved into cloister seats in many English cathedrals:  Canterbury, Gloucester, Norwich, Salisbury and Westminster Abbey - so popular was it that there is some evidence that it was outlawed amongst the clergy in medieval times. The word 'Morris' here is not the same 'Morris' as from 'Morris Dancing' (which derives from 'Moorish' - the medieval culture of north-west Africa) but instead comes from the Latin word 'Merellus', which means a counter or gaming piece.

The objective of the game is to get your three counters in a row, either horizontally, vertically or diagonally.

The board is a three row three column grid like so:
-----
|\|/|
|-+-|
|/|\|
-----

There are two players, white and black. 
As in the game of Chess, the white player moves first. 
Players may choose any method they like to determine who plays white and who plays black.
Each player has three pieces of their own colour.
Each player takes it in turns to place a piece.
As soon as a player places a piece that gives them a row of three, either horizontally, vertically or diagonally, they have won.
If a player has placed all three of their pieces, then they must pick up one of their already placed pieces and move it to a vacant space, either horizontally, vertically or diagonally.
A piece cannot be replaced in its original place, nor may it be placed on an opponents piece.



