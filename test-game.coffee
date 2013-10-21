should = require('chai').should()

board = {}

class Board
	constructor: ->
		@turn = 1
		@positions = "---------".split ''
	isWin: ->
		if @winner() 
			true
		else 
			false
	isWinFor: (p) ->
		win = false
		if (@positions[0] is p and @positions[1] is p and @positions[2] is p)
			win = true
		if (@positions[3] is p and @positions[4] is p and @positions[5] is p)
			win = true
		win
	winner: ->
		if @isWinFor('B')
			return 'B'
		if @isWinFor('W')
			return 'W'
		false
	canPlay: (player, old_position, new_position) ->
		if 0 < new_position < 10
			if player is 'W' 
				return @turn % 2 is 1
			if player is 'B'
				return @turn % 2 is 0
			return false
		else
			false
	play: (player, old_position, new_position) ->
		if @canPlay(player, old_position, new_position)
			@positions[new_position - 1] = player
			@turn++
			true
		else
			false
	isEmpty: (position) ->
		@positions[position - 1] is '-'

class Move
	constructor: (@player, @current_pos, @future_pos) ->
		if player isnt 'W' and player isnt 'B'
			throw new Error "Invalid player"
		if @future_pos is null
			throw new Error "Invalid location: null"
		if @current_pos < 1 or @current_pos > 9
			throw new Error "Invalid location"
		if @future_pos < 1 or @future_pos > 9
			throw new Error "Invalid location"

describe 'A move', ->
	describe 'has a player which', ->
		it 'should be black or white', ->
			(-> new Move('B', null, 1)).should.not.throw 
			(-> new Move('W', null, 1)).should.not.throw 
		it 'should not allow non-black or white players', ->
			(-> new Move('X', 1, 1)).should.throw "Invalid player"
		it 'should allow a current piece position of null', ->
			(-> new Move('W', null, 3)).should.not.throw
		it 'should not allow null for the future piece position', ->
			(-> new Move('W', null, null)).should.throw "Invalid location"
		it 'should not allow a current piece location of less than 1', ->
			(-> new Move('W', 0, 1)).should.throw "Invalid location"
		it 'should not allow a future piece position of less than 1', ->
			(-> new Move('W', null, 0)).should.throw "Invalid location"
		it 'should not allow a future location greater than 9', ->
			(-> new Move('W', null, 10)).should.throw "Invalid location"


describe 'A board initialiser', ->
	it 'should when given an empty array return an empty board', ->
		board_init = ->
			new Board
		board = board_init([])
		board.turn.should.equal 1
		board.isWin().should.be.false
	it 'should when given a single play return a board with onbe white piece', ->
		board_init = (moves) ->
			b = new Board
			b.play('W', null, moves[0])
			b
		board = board_init([[5]])
		board.turn.should.equal 2
		board.positions[4].should.equal 'W'		

describe 'An empty board', ->
	beforeEach ->
		board = new Board

	it 'should not be a winning board', ->
		board.isWin().should.be.false
	it 'should be on turn one', ->
		board.turn.should.equal 1
	it 'should allow White to place a piece at position 1', ->
		board.canPlay('W', null, 1).should.be.true
	it 'should not allow Black to place a piece', ->
		board.canPlay('B', null, 1).should.be.false
	it 'should not allow White to play at position other than 1-9', ->
		board.canPlay('W', null, 0).should.be.false
		board.canPlay('W', null, 10).should.be.false
	for i in [1..9]
		do (i) ->
			it "should have position #{i} be empty", ->
				board.isEmpty(i).should.be.true
	it 'should have a white piece in position 1 have if white plays there', ->
		board.play('W', null, 1).should.be.true
		board.isEmpty(1).should.be.false

describe 'A board with one white play in the centre', ->
	beforeEach ->
		board = new Board
		board.play 'W', null, 5

	it 'should be on turn two', ->
		board.turn.should.equal 2
	it 'should not allow White to play next', ->
		board.canPlay('W', null, 6).should.be.false
	it 'should allow Black to play in position 1', ->
		board.canPlay('B', null, 1).should.be.true
	it 'should not be a winning board', ->
		board.isWin().should.be.false

describe 'A board with two plays', ->
	beforeEach ->
		board = new Board
		board.play 'W', null, 5
		board.play 'B', null, 1

	it 'should be on turn three', ->
		board.turn.should.equal 3
	it 'should not allow Black to play next', ->
		board.canPlay('B', null, 2).should.be.false
	it 'should allow White to play in position 3', ->
		board.canPlay('W', null, 3).should.be.true
	it 'should not be a win', ->
		board.isWin().should.be.false

describe 'A board that has a winning top row of white pieces', ->
	beforeEach ->
		board = new Board
		board.play 'W', null, 1
		board.play 'B', null, 4
		board.play 'W', null, 2
		board.play 'B', null, 5
		board.play 'W', null, 3

	it 'should be a win', ->
		board.isWin().should.be.true
	it 'should be a win for white', ->
		board.winner().should.equal 'W'

describe 'A board that has a winning top row of black pieces', ->
	beforeEach ->
		board = new Board
		board.play 'W', null, 5
		board.play 'B', null, 1
		board.play 'W', null, 6
		board.play 'B', null, 2
		board.play 'W', null, 8
		board.play 'B', null, 3
	it 'should be a win', ->
		board.isWin().should.be.true
	it 'should be a win for Black', ->
		board.winner().should.equal 'B'

describe 'A board with a winning middle row of white pieces', ->
	beforeEach ->
		board = new Board
		board.play 'W', null, 4
		board.play 'B', null, 1
		board.play 'W', null, 5
		board.play 'B', null, 2
		board.play 'W', null, 6
	it 'should be a win', ->
		board.isWin().should.be.true
	it 'should be a win for White', ->
		board.winner().should.equal 'W'		

# describe 'A board where White and Black have played all their pieces', ->
# 	it 'should not allow Black to play next', ->
# 		board = new Board
# 		board.play 'W', null, 1
# 		board.play 'B', null, 2
# 		board.play 'W', null, 3
# 		board.play 'B', null, 4

