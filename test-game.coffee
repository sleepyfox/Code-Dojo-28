should = require('chai').should()

class Board
	constructor: (position_string) ->
		@board_positions = position_string.split ''
		@turn = 1
		@turn++ for i in @board_positions when i is 'W' or i is 'B'
	play: (position, player) -> 
		if 0 < position < 10 
			if player is "White" and @turn % 2 is 1
				return true
			if player is "Black" and @turn % 2 is 0
				return true
		false
	win: -> 
		false

describe 'An empty board', ->
	it 'should have no winner', ->
		board = new Board "---------"
		board.win().should.equal false
	it 'should be not be able to play in a position < 1', ->
		board = new Board "---------"
		board.play(-1).should.be.false
	it 'should not be able to play in a position > 9', ->
		board = new Board "---------"
		board.play(10).should.be.false
	it 'should allow white to play in position 1', ->
		board = new Board "---------"
		board.play(1, "White").should.be.true
		board.play(8, "White").should.be.true
	it 'should not allow black to play', ->
		board = new Board "---------"
		board.play(1, "Black").should.be.false
		board.play(5, "Black").should.be.false

describe 'A board with one white stone', ->
	it 'should be on turn two', ->
		board = new Board "-W-------"
		board.turn.should.equal 2
	it 'should not allow white to play', ->
		board = new Board "-W-------"
		board.play(5, "White").should.be.false
		board.play(1, "White").should.be.false

