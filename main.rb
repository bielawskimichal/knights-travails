require 'pry'
require 'pry-byebug'
require_relative 'lib/chessboard'

test = Chessboard.new
print test.knight_moves([0, 4], [0, 2])
