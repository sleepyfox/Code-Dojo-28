should = require('chai').should()

board = {}

class Board
	constructor: ->
		@turn = 1
		@positions = "---------".split ''
	isWin: -> false
	canPlay: (player, old_position, new_position) ->
		if 0 < new_position < 10
			if player is 'W' and @turn % 2 is 1
				true
			else
				false
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

	it 'should not be won', ->
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
	it 'should be on turn two', ->
		board = new Board
		board.play 'W', null, 5
		board.turn.should.equal 2
	it 'should not allow White to play next', ->
		board = new Board
		board.play 'W', null, 5
		board.canPlay('W', null, 6).should.be.false
