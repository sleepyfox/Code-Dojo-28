assert = require 'assert'
should = require('chai').should()
expect = require('chai').expect

create_new_board = ->
  []

place_piece = (board, place) ->
  # returns a new board
  if place in board
    throw "Place already taken"
  else
    [...board, place]

equals = (board, another_board) ->
  JSON.stringify(board.sort()) is JSON.stringify(another_board.sort())

is_win_for_white = (board) ->
  # returns a boolean
  whites_moves = board.filter((x, i) -> i % 2 is 0)
  (equals [0, 1, 2], whites_moves) or
  (equals [3, 4, 5], whites_moves) or
  (equals [6, 7, 8], whites_moves) or
  (equals [0, 3, 6], whites_moves) or
  (equals [1, 4, 7], whites_moves) or
  (equals [2, 5, 8], whites_moves) or
  (equals [0, 4, 8], whites_moves) or
  (equals [2, 4, 6], whites_moves)


describe 'Placing pieces', ->
  it 'should allow a piece to be placed', ->
    place_piece(create_new_board(), 0).length.should.equal 1

  it 'should allow two pieces to be placed', ->
    new_board = place_piece(create_new_board(), 0)
    place_piece(new_board, 1).length.should.equal 2

  it 'should not allow a piece to be placed where there is already another piece', ->
    new_board = place_piece(create_new_board(), 0)
    expect(-> place_piece(new_board, 0)).to.throw()

describe 'Winning the game', ->
  it 'should recognise a win on the top row by white', ->
    current_board = [0, 3, 1, 4]
    is_win_for_white(place_piece(current_board, 2)).should.be.true

  it 'should recognise a win on the middle row by white', ->
    current_board = [3, 0, 4, 1]
    is_win_for_white(place_piece(current_board, 5)).should.be.true

  it 'should recognise a win on the bottom row by white', ->
    current_board = [6, 0, 7, 1]
    is_win_for_white(place_piece(current_board, 8)).should.be.true

  it 'should recognise a win on the first column by white', ->
    current_board = [0, 2, 3, 1]
    is_win_for_white(place_piece(current_board, 6)).should.be.true

  it 'should recognise a win on the second column by white', ->
    current_board = [1, 2, 4, 0]
    is_win_for_white(place_piece(current_board, 7)).should.be.true

  it 'should recognise a win on the third column by white', ->
    current_board = [2, 1, 5, 0]
    is_win_for_white(place_piece(current_board, 8)).should.be.true

  it 'should recognise a win on the leading diagonal by white', ->
    current_board = [0, 1, 4, 2]
    is_win_for_white(place_piece(current_board, 8)).should.be.true
