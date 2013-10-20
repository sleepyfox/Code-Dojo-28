should = require('chai').should()

describe 'An empty board', ->
	class Board
		constructor: () ->
		play: (position, player) -> 
			if 0 < position < 10 
				if player = "White" 
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
	it 'should allow a play in position 1', ->
		board = new Board 
		board.play(1).should.be.true


# describe 'A board with a single black stone', ->
# 	it 'should have no winner', ->
