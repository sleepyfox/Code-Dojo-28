WHITE = 'W'
BLACK = 'B'
EMPTY = '-'

class Board
  constructor: ->
    @turn = 1
    @positions = "---------".split ''
  isWin: ->
    if @winner()
      true
    else
      false
  isWinFor: (player) ->
    win = false
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
            [0, 4, 8], [2, 4, 6]]            # diagonals
    for line in wins
      if (@positions[line[0]] is player and
          @positions[line[1]] is player and
          @positions[line[2]] is player)
        win = true
    win
  winner: ->
    if @isWinFor(BLACK)
      return BLACK
    if @isWinFor(WHITE)
      return WHITE
    false
  canPlay: (player, old_position, new_position) ->
    if 0 < new_position < 10
      if @positions[new_position - 1] isnt EMPTY
        return false
      if player is WHITE
        return @turn % 2 is 1
      if player is BLACK
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
    @positions[position - 1] is EMPTY

class Move
  # Note: this is a desired move, not necessarily a valid one
  #       in the context of the current board.
  constructor: (@player, @current_pos, @future_pos) ->
    if @player isnt WHITE and @player isnt BLACK
      throw new Error "Invalid player"
    if @future_pos is null
      throw new Error "Invalid location: null"
    if @current_pos isnt null
      if @current_pos < 1 or @current_pos > 9
        throw new Error "Invalid location"
    if @future_pos < 1 or @future_pos > 9
      throw new Error "Invalid location"

next_player = (current_player) ->
  if current_player is WHITE
    BLACK
  else
    WHITE

board_init = (moves) ->
  board = new Board
  if moves.length is 0
    return board
  for i in [1..moves.length]
    move = moves[i - 1]
    player = next_player player
    throw new Error "Not empty location" unless board.play(player, null, move)
  board

module.exports =
  Move: Move
  WHITE: WHITE
  BLACK: BLACK
  EMPTY: EMPTY
  board_init: board_init
  Board: Board
