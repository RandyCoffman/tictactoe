require_relative "tictac_board.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)

	end

	def moves_available(board_class)
	  my_array = []
	  @board = board_class.board
	  @board.each_pair do |key,value|
	      if value.class == Integer
	          my_array.push(value)
	      end
	  end
	  my_array
	end


end