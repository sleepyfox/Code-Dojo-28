Code Dojo 27
============
This is my worked example from the 28th meeting of the London Code Dojo. Feel free to play around with it. I've used Node.js and CoffeeScript with the Mocha testing library and the Chai assertion library.

The tests can be run from the command-line with [mocha](http://visionmedia.github.io/mocha/):
	
	mocha --compilers coffee:coffee-script -R spec test-*.coffee

You can also use this with the **-w** flag to have mocha watch for file changes and re-run the tests (this obviates the need for watchr or similar tools).

The source of the kata is the ancient game of Three Men's Morris, similar to Noughts and Crosses, of which you can find out more [here](http://en.wikipedia.org/wiki/Three_Men%27s_Morris). 
You can find out more about the London Code Dojo at our [homepage](http://www.meetup.com/London-Code-Dojo/).
