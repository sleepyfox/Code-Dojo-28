should = require('chai').should()

EMPTY_BOARD = '---------'
WHITE = 'W'
BLACK = 'B'

valid_board = (position_string) ->
	position_string.match(/[\-WB]{9}/) isnt null
	
class Board
	constructor: (position_string) ->
		if valid_board(position_string)
			@board_positions = position_string.split ''
			@turn = 1
			@turn++ for i in @board_positions when i is WHITE or i is BLACK
		else 
			throw new Error "Invalid board"
	play: (position, player) -> 
		if 0 < position < 10 
			if player is WHITE and @turn % 2 is 1
				return true
			if player is BLACK and @turn % 2 is 0
				return true
		false
	win: -> false

describe 'A board validator', ->
	it 'should reject boards with fewer than 9 positions', ->
		valid_board('').should.be.false
		valid_board('gjgjgj').should.be.false
	it 'should reject boards with more than 9 positions', ->
		valid_board('1234567890').should.be.false
		valid_board('kjsfhgkfdhgkhfdgkfdhkghfdkgkjdhfg').should.be.false
	it 'should reject boards that contain other than W, B and -', ->
		valid_board('lsalsalsa').should.be.false 
	it 'should accept a valid empty board', ->
		valid_board(EMPTY_BOARD).should.be.true		

describe 'A board when initialised', ->
	it 'should accept a starting position of only nine characters', ->
		board = new Board EMPTY_BOARD
		board.turn.should.equal 1
	it 'should not accept a starting position of fewer than nine chars', ->
		(-> board = new Board 'ghghgh').should.throw "Invalid board"
	it 'should not accept a starting position of more than nine chars', ->
		(-> board = new Board 'kjdshfkdsjhfss').should.throw "Invalid board"


describe 'An empty board', ->
	it 'should have no winner', ->
		board = new Board EMPTY_BOARD
		board.win().should.equal false
	it 'should be not be able to play in a position < 1', ->
		board = new Board EMPTY_BOARD
		board.play(-1).should.be.false
	it 'should not be able to play in a position > 9', ->
		board = new Board EMPTY_BOARD
		board.play(10).should.be.false
	it 'should allow white to play in position 1', ->
		board = new Board EMPTY_BOARD
		board.play(1, WHITE).should.be.true
		board.play(8, WHITE).should.be.true
	it 'should not allow black to play', ->
		board = new Board EMPTY_BOARD
		board.play(1, BLACK).should.be.false
		board.play(5, BLACK).should.be.false

describe 'A board with one white stone', ->
	it 'should be on turn two', ->
		board = new Board "-W-------"
		board.turn.should.equal 2
	it 'should not allow white to play', ->
		board = new Board "-W-------"
		board.play(5, WHITE).should.be.false
		board.play(1, WHITE).should.be.false

