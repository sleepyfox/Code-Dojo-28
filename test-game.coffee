should = require('chai').should()

EMPTY_BOARD = '---------'
WHITE = 'W'
BLACK = 'B'
INVALID_BOARD_ERROR = "Invalid board"

count_stones = (position_string, colour) ->
	position_string.split('').filter((a) -> a is colour).length

valid_board = (position_string) ->
	white_stones = count_stones(position_string, WHITE)
	black_stones = count_stones(position_string, BLACK)
	(position_string.match(/[\-WB]{9}/) isnt null) and (
		(white_stones is black_stones) or (white_stones is black_stones + 1))

class Board
	constructor: (position_string) ->
		if valid_board(position_string)
			@board_positions = position_string.split ''
			@turn = 1
			@turn++ for i in @board_positions when i is WHITE or i is BLACK
		else 
			throw new Error INVALID_BOARD_ERROR
	play: (position, player) -> 
		if 0 < position < 10 
			if player is WHITE and @turn % 2 is 1
				return true
			if player is BLACK and @turn % 2 is 0
				return true
		false
	win: -> false
	isEmpty: (n) ->
		@board_positions[n-1] is '-'

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
	it 'should reject a board that has too many white stones', ->
		valid_board('WW-------').should.be.false
		valid_board('----W-W-W').should.be.false
	it 'should reject a board with too many black stones', ->
		valid_board('B--------').should.be.false
		valid_board('WBWBWBB--').should.be.false
	it 'should accept a board with equal numbers of white and black stones', ->
		valid_board('WBWBWBWB-').should.be.true
		valid_board('WWWBBB---').should.be.true

describe 'A board when initialised', ->
	it 'should accept a starting position of only nine characters', ->
		board = new Board EMPTY_BOARD
		board.turn.should.equal 1
	it 'should not accept a starting position of fewer than nine chars', ->
		(-> board = new Board 'ghghgh').should.throw INVALID_BOARD_ERROR
	it 'should not accept a starting position of more than nine chars', ->
		(-> board = new Board 'kjdshfkdsjhfss').should.throw INVALID_BOARD_ERROR

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
	it 'should allow black to play next in position 1', ->
		board = new Board "-W-------"
		board.play(1, BLACK).should.be.true
	it 'should show position one to be empty', ->
		board = new Board "-W-------"
		board.isEmpty(1).should.be.true
	it 'should show position two not to be empty', ->
		board = new Board "-W-------"
		board.isEmpty(2).should.be.false		

describe 'A board with two white stones', ->
	it 'should not be valid', ->
		(-> board = new Board 'WW-------').should.throw INVALID_BOARD_ERROR

describe 'A board with two black stones', ->
	it 'should not be valid', ->
		(-> board = new Board 'BB-------').should.throw INVALID_BOARD_ERROR

describe 'A white stone counter', ->
	it 'should count an empty string as no white stones', ->
		count_stones('', WHITE).should.equal 0
	it 'should count "W" as one white stone', ->
		count_stones('W', WHITE).should.equal 1
	it 'should count "B" as no white stones', ->
		count_stones('B', WHITE).should.equal 0
	it 'should count "WBW" as two white stones', ->
		count_stones('WBW', WHITE).should.equal 2
	it 'should count "-BWosudW" as two white stones', ->
		count_stones('-BWosudW', WHITE).should.equal 2

describe 'A black stone counter', ->
	it 'should count an empty string as no black stones', ->
		count_stones('', BLACK).should.equal 0
	it 'should count "B" as one black stone', ->
		count_stones('B', BLACK).should.equal 1
	it 'should count "W" as no black stones', ->
		count_stones('W', BLACK).should.equal 0
	it 'should count "BWB" as two black stones', ->
		count_stones('BWB', BLACK).should.equal 2
	it 'should count "-BWosudB" as two black stones', ->
		count_stones('-BWosudB', BLACK).should.equal 2
		


