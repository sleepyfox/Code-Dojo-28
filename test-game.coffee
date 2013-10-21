should = require('chai').should()

describe 'An empty board', ->
	it 'should not be won', ->
		class Board 
			isWin: -> false
		board = new Board
		board.isWin().should.be.false
