should = require('chai').should()
{ Move, BLACK, WHITE, board_init, Board } = require './morris'

board = {}

describe 'A move', ->
  describe 'has a player which', ->
    it 'should be black or white', ->
      (-> new Move(BLACK, null, 1)).should.not.throw(Error)
      (-> new Move(WHITE, null, 1)).should.not.throw(Error)
    it 'should not allow non-black or white players', ->
      (-> new Move('X', 1, 1)).should.throw "Invalid player"
    it 'should allow a current piece position of null', ->
      (-> new Move(WHITE, null, 3)).should.not.throw()
    it 'should not allow null for the future piece position', ->
      (-> new Move(WHITE, null, null)).should.throw "Invalid location"
    it 'should not allow a current piece location of less than 1', ->
      (-> new Move(WHITE, 0, 1)).should.throw "Invalid location"
    it 'should not allow a future piece position of less than 1', ->
      (-> new Move(WHITE, null, 0)).should.throw "Invalid location"
    it 'should not allow a future location greater than 9', ->
      (-> new Move(WHITE, null, 10)).should.throw "Invalid location"

describe 'A board initialiser', ->
  it 'should when given an empty array return an empty board', ->
    board = board_init []
    board.turn.should.equal 1
    board.isWin().should.be.false
  it 'should when given a single play return a board with one White piece', ->
    board = board_init [5]
    board.turn.should.equal 2
    board.positions[4].should.equal WHITE
  it 'should after two plays return a board with a White and a Black piece', ->
    board = board_init [5,1]
    board.turn.should.equal 3
    board.positions[4].should.equal WHITE
    board.positions[0].should.equal BLACK
  it 'should when given two plays in the same space throw an error', ->
    (-> board = board_init [1, 1]).should.throw "Not empty location"

describe 'An empty board', ->
  beforeEach ->
    board = new Board
  it 'should not be a winning board', ->
    board.isWin().should.be.false
  it 'should be on turn one', ->
    board.turn.should.equal 1
  it 'should allow White to place a piece at position 1', ->
    board.canPlay(WHITE, null, 1).should.be.true
  it 'should not allow Black to place a piece', ->
    board.canPlay(BLACK, null, 1).should.be.false
  it 'should not allow White to play at position other than 1-9', ->
    board.canPlay(WHITE, null, 0).should.be.false
    board.canPlay(WHITE, null, 10).should.be.false
  for i in [1..9]
    do (i) ->
      it "should have position #{i} be empty", ->
        board.isEmpty(i).should.be.true
  it 'should have a white piece in position 1 have if white plays there', ->
    board.play(WHITE, null, 1).should.be.true
    board.isEmpty(1).should.be.false

describe 'A board with one white play in the centre', ->
  beforeEach ->
    board = board_init [5]
  it 'should be on turn two', ->
    board.turn.should.equal 2
  it 'should not allow White to play next', ->
    board.canPlay(WHITE, null, 6).should.be.false
  it 'should allow Black to play in position 1', ->
    board.canPlay(BLACK, null, 1).should.be.true
  it 'should not be a winning board', ->
    board.isWin().should.be.false
  it 'should not allow Black to play in the centre', ->
    board.canPlay(BLACK, null, 5).should.be.false

describe 'A board with two plays', ->
  beforeEach ->
    board = board_init [5, 1]
  it 'should be on turn three', ->
    board.turn.should.equal 3
  it 'should not allow Black to play next', ->
    board.canPlay(BLACK, null, 2).should.be.false
  it 'should allow White to play in position 3', ->
    board.canPlay(WHITE, null, 3).should.be.true
  it 'should not be a win', ->
    board.isWin().should.be.false

describe 'A board that has a winning top row of White pieces', ->
  beforeEach ->
    board = board_init [1, 4, 2, 5, 3]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for white', ->
    board.winner().should.equal WHITE

describe 'A board that has a winning top row of Black pieces', ->
  beforeEach ->
    board = board_init [5, 1, 6, 2, 8, 3]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for Black', ->
    board.winner().should.equal BLACK

describe 'A board with a winning middle row of White pieces', ->
  beforeEach ->
    board = board_init [4, 1, 5, 2, 6]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal WHITE

describe 'A board with a winning bottom row of White pieces', ->
  beforeEach ->
    board = board_init [7, 1, 8, 2, 9]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal WHITE

describe 'A board with a winning left column of Black pieces', ->
  beforeEach ->
    board = board_init [5, 1, 8, 4, 9, 7]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal BLACK

describe 'A board with a winning middle column of Black pieces', ->
  beforeEach ->
    board = board_init [1, 2, 9, 5, 7, 8]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal BLACK

describe 'A board with a winning right column of Black pieces', ->
  beforeEach ->
    board = board_init [1, 3, 2, 6, 7, 9]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal BLACK

describe 'A board with a winning leading diagonal of White pieces', ->
  beforeEach ->
    board = board_init [1, 2, 5, 3, 9]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal WHITE

describe 'A board with a winning trailing diagonal of White pieces', ->
  beforeEach ->
    board = board_init [3, 2, 5, 4, 7]
  it 'should be a win', ->
    board.isWin().should.be.true
  it 'should be a win for White', ->
    board.winner().should.equal WHITE

describe 'A board where White and Black have played all their pieces', ->
  it 'should not allow Black to play next', ->
    board = board_init [1, 2, 5, 3, 8, 7]
    board.canPlay(BLACK, null, 4).should.be.false
  it 'should allow White to play next', ->
    board = board_init [1, 2, 5, 3, 8, 7]
    board.canPlay(WHITE, 1, 9).should.be.true
