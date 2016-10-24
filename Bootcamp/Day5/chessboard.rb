require "pry"
require "byebug"

class Array_2d < Array

end


class ChessPiece
  attr_reader :color, :position, :options, :move_count

  def initialize(color)
    @unicode = nil
    @color = color
    @moved = false
  end

  def set_moved(moved)
    @moved = moved
  end

  def position_on_board?(position)
    return false if position[0] >= 0 || position[0] <= 7 || position[1] >= 0 || position[1] <= 7
    true
  end

end

class Pawn < ChessPiece
  def initialize(color, position, options={})
    @color = color
    @position = position
    @options = options
    @move_count = 0
  end

  def move_forward(steps=1)
    @move_count = @move_count + 1
    @position[1] += steps
  end

  def move_back(steps=1)
    @move_count = @move_count + 1
    @position[1] -= steps
  end

  def move_to(old_position=@position, new_position)
    byebug
    if valid_move?(new_position, old_position)
      if new_position[1] - old_position[1] == 2
        move_forward(2)
      elsif new_position[1] - old_position[1] == 1
        move_forward
      elsif new_position[1] - old_position[1] == -1
        move_back
      end
    else "Illegal Move"
    end
  end

  def valid_move?(new_position, old_position=@position)
    column_check = false
    row_check = false
    if new_position[0] == old_position[0]; column_check = true end
    if new_position[1] - old_position[1] == 2 && @move_count == 0; row_check = true end
    if new_position[1] - old_position[1] == 1 || -1; row_check = true; end
    if column_check && row_check; return true; else return false; end
  end
end


class ChessBoard
  attr_reader :board

  def initialize
    @board = Hash.new
    new_setup
  end

  def new_setup
    (0..7).each { |i| @board[[i,1]] = Pawn.new('Black') }
    (0..7).each { |i| @board[[i,6]] = Pawn.new(:b) }
  end
end

new_board = ChessBoard.new
print new_board.board
