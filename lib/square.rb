class Square
  attr_accessor :neighbours, :row, :column, :top, :top_right, :right, :bottom_right, :bottom, :bottom_left, :left,
                :top_left

  def initialize
    @row = nil
    @column = nil

    @top = nil
    @top_right = nil
    @right = nil
    @bottom_right = nil
    @bottom = nil
    @bottom_left = nil
    @left = nil
    @top_left = nil

    @neighbours = []
  end
end
