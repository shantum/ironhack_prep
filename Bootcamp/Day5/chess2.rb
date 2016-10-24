require "byebug"

module Translator
  def translate(pos)
    pos_array = pos.split('')
    original_column_value = pos_array[0].to_s.downcase #a = 0, b = 1
    original_row_value = pos_array[1].to_i #1 = 7; 2 = 6; 3 = 5
    coordinates = [nil, nil]

    column_keys = {'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7}
    row_keys = {1 => 7, 2 => 6, 3 => 5, 4 => 4, 5 => 3, 6 => 2, 7 => 1, 8 => 0}

    new_column_value = column_keys[original_column_value].to_i
    new_row_value = row_keys[original_row_value].to_i

    unless new_row_value > 7
      coordinates = [new_column_value, new_row_value]
    end

    return coordinates
  end
end

class Board
  attr_reader :board
  include Translator

  def initialize
    @board = [[nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil, nil]]
  end

  def set_new_board
    self.set_all_pawns
  end

  def set_all_pawns
    for i in (0..7) do
        @board[i][1] = Pawn.new(:w);
        @board[i][6] = Pawn.new(:b);
     end
   end

    def print_board
      print @board
    end

    def set_piece(piece, position)
      position = translate(position)
      @board[position[0]][position[1]] = piece
    end

    def valid_move?(old_pos, new_pos)
      get_piece(old_position)
    end

    def get_piece(position)
      pos_array = translate(position)
      piece = @board[pos_array[0]][pos_array[1]]
    end

    def move_piece(from, to)
      piece = get_piece(from)
      original_coordinates = self.translate(from)
      new_coordinates = self.translate(to)

      if get_piece(to) == nil && get_piece(from) != nil && piece.check_move(from, to)
      	set_piece(piece, to);
      	set_piece(nil, from);
      	piece.set_moved
      	puts 'Legal'
      else puts 'Illegal'
      end
    end
end

  class Piece
    attr_reader :color, :moved
    include Translator

    def initialize(color)
      @color = color.to_sym
    end
  end

  class Pawn < Piece
    attr_reader :options, :name

    def initialize(color, options={})
      super(color)
      @name = "#{color}Pawn"
      @options = options
      @moved = false
    end

    def set_moved
      @moved = true
    end

    def check_move(from, to)
      if column_check(from, to) && row_check(from, to); return true
      else return false; end
    end

    def column_check(from, to)
      column_check = false
      old_column_value = self.translate(from)[0]
      new_column_value = self.translate(to)[0]

      if old_column_value - new_column_value == 0; column_check = true; end

      return column_check
    end

    def row_check(from, to)
      row_check = false
      old_row_value    = self.translate(from)[1]
      new_row_value    = self.translate(to)[1]

      if @moved == false && (old_row_value - new_row_value == 2 || old_row_value - new_row_value == 2)
      	row_check = true;
      end
      if old_row_value - new_row_value = 1 || old_row_value - new_row_value =  -1
        row_check = true;
    end

      return row_check
    end
  end



  board = Board.new
  board.set_all_pawns()
  board.move_piece('a2', 'a3')
  board.move_piece('a2', 'a4')
  board.move_piece('a2', 'a5')
  board.move_piece('a7', 'a6')
  board.move_piece('a7', 'a5')
  board.move_piece('a7', 'a4')
  board.move_piece('a7', 'b6')








