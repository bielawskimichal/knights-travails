require_relative 'square'
require 'pry-byebug'

class Chessboard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { Square.new } }
    build_chessboard
    create_neighbours
  end

  def build_chessboard
    @board.each_with_index do |row, x|
      row.each_with_index do |square, y|
        square.row = x
        square.column = y
      end
    end
  end

  def create_neighbours
    @board.each do |row|
      row.each do |square|
        square.top = @board[square.row + 1][square.column + 2] unless square.row >= 7 || square.column >= 6
        square.top_right = @board[square.row + 2][square.column + 1] unless square.row >= 6 || square.column >= 7
        square.right = @board[square.row - 1][square.column + 2] unless square.row <= 0 || square.column >= 6
        square.bottom_right = @board[square.row - 2][square.column + 1] unless square.row <= 1 || square.column >= 7
        square.bottom = @board[square.row - 1][square.column - 2] unless square.row <= 0 || square.column <= 1
        square.bottom_left = @board[square.row - 2][square.column - 1] unless square.row <= 1 || square.column <= 0
        square.left = @board[square.row + 1][square.column - 2] unless square.row >= 7 || square.column <= 1
        square.top_left = @board[square.row + 2][square.column - 1] unless square.row >= 6 || square.column <= 0
        square.neighbours = [square.top, square.top_right, square.right, square.bottom_right, square.bottom,
                             square.bottom_left, square.left, square.top_left]
      end
    end
  end

  def coordinates(square)
    [square.row, square.column]
  end

  def find(coordinates)
    @board[coordinates[0]][coordinates[1]]
  end

  def knight_moves(start, goal)
    queue = [[find(start), [start]]]
    visited = { start => true }

    until queue.empty?
      current, path = queue.shift
      next if current.nil?
      return path if coordinates(current) == goal

      current.neighbours.each do |neighbour|
        next if neighbour.nil?

        coordinates = coordinates(neighbour)

        unless visited[coordinates]
          visited[coordinates] = true
          queue.push([neighbour, path + [coordinates]])
        end
      end
      path
    end
  end
end
