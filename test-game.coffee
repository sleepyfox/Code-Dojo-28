should = require('chai').should()

describe 'An empty board', ->
	it 'should not be won', ->
		class Board 
			isWin: -> false
		board = new Board
		board.isWin().should.be.false
	it 'should be on turn one', ->
		class Board
			constructor: ->
				@turn = 1
		board = new Board
		board.turn.should.equal 1