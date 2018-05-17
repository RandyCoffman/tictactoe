require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)
		# not putting anything in here until I get all my rules laid out and can figure out how it can make choices based on the rules
	end

	def winning_move(board_class,player)
	  	moves_available(board_class).each { |winning_spot|
	    	if board_class.winner_or_loser?()
	    		p winning_spot
	      		return winning_spot
	    	end
	  	}
	end

	def moves_available(board_class)
	  my_array = []
	  board = board_class.board
	  board.each_pair do |key,value|
	      if value.class == Integer
	          my_array.push(value)
	      end
	  end
	  my_array
	end


end