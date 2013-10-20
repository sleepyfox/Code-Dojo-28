should = require('chai').should()

describe 'An empty board', ->
	class Board
		constructor: () ->
		play: (position, player) -> 
			if 0 < position < 10 
				if player is "White" 
					true
				else
					false 
			else 
				false
		win: -> 
			false
	it 'should have no winner', ->
		board = new Board
		board.win().should.equal false
	it 'should be not be able to play in a position < 1', ->
		board = new Board
		board.play(-1).should.be.false
	it 'should not be able to play in a position > 9', ->
		board = new Board 
		board.play(10).should.be.false
	it 'should allow white to play in position 1', ->
		board = new Board 
		board.play(1, "White").should.be.true
		board.play(8, "White").should.be.true
	it 'should not allow black to play', ->
		board = new Board
		board.play(1, "Black").should.be.false
		board.play(5, "Black").should.be.false


