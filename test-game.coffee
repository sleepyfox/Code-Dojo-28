should = require('chai').should()

board = {}

class Board
	constructor: ->
		@turn = 1
		@positions = "---------".split ''
	isWin: ->
		if (@positions[0] is 'W' and @positions[1] is 'W' and @positions[2] is 'W' )
			true
		else
			false
	winner: -> 'W'
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

xdescribe 'A board that has a winning top row of black pieces', ->
	it 'should be a win', ->


# describe 'A board where White and Black have played all their pieces', ->
# 	it 'should not allow Black to play next', ->
# 		board = new Board
# 		board.play 'W', null, 1
# 		board.play 'B', null, 2
# 		board.play 'W', null, 3
# 		board.play 'B', null, 4

