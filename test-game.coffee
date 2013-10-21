should = require('chai').should()

describe 'An empty board', ->
	board = {}

	class Board
		constructor: ->
			@turn = 1
			@positions = "---------".split ''
		isWin: -> false
		canPlay: (player, old_position, new_position) ->
			if 0 < new_position < 10
				if player is 'W' 
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
	it 'should have position 1 be empty', ->
		board.isEmpty(1).should.be.true
	it 'should have position 2 be empty', ->
		board.isEmpty(2).should.be.true
	it 'should have position 3 be empty', ->
		board.isEmpty(3).should.be.true
	it 'should have position 4 be empty', ->
		board.isEmpty(4).should.be.true
	it 'should have position 5 be empty', ->
		board.isEmpty(5).should.be.true
	it 'should have position 6 be empty', ->
		board.isEmpty(6).should.be.true
	it 'should have position 7 be empty', ->
		board.isEmpty(7).should.be.true
	it 'should have position 8 be empty', ->
		board.isEmpty(8).should.be.true
	it 'should have position 9 be empty', ->
		board.isEmpty(9).should.be.true
	it 'should have a white piece in position 1 have if white plays there', ->
		board.play('W', null, 1).should.be.true
		board.isEmpty(1).should.be.false


