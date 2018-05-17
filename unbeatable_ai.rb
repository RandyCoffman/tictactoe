require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)
		spot_chosen(board_class,player)
		# not putting anything in here until I get all my rules laid out and can figure out how it can make choices based on the rules
	end

	def spot_chosen(board_class,player)
		board = board_class.board
		winning_combo = board_class.win
		x_array = []
		o_array = []
		winning_combo.each { |wins|
			board.each_pair { |key,value|
				if value == "x"
					x_array.push(key.to_i)
				elsif value == "o"
					o_array.push(key.to_i)
				end
				x_array.uniq!
				o_array.uniq!
			}
		}
		if player.player == "o"
			o_array
		elsif player.player == "x"
			x_array
		end
	end

	def moves_available(board_class)
	  	my_array = []
	  	board = board_class.board
	  	board.each_pair { |key,value|
	    	if value.class == Integer
	        	my_array.push(value)
	    	end
	  	}
	 	my_array
	end


end