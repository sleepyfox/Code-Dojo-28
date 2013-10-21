should = require('chai').should()

describe 'An empty board', ->
	board = {}

	class Board
		constructor: ->
			@turn = 1
		isWin: -> false
		canPlay: (player, old_position, new_position) ->
			if player is 'W' 
				true
			else
				false
				
	beforeEach ->
		board = new Board

	it 'should not be won', ->
		board.isWin().should.be.false
	it 'should be on turn one', ->
		board.turn.should.equal 1
	it 'should allow White to place a piece at position 1', ->
		board.canPlay('W', null, 1).should.be.true
	it 'should not allow Black to place a piece at position 1', ->
		board.canPlay('B', null, 1).should.be.false