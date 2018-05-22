require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)

# not putting anything in here until I get all my rules laid out and can figure out how it can make choices based on the rules
	end

	def board_copy(board_class)
# Making a duplicate of the board. When testing moves I don't want to change the actual board while testing
	    board_class.board
	end

# i is a made up value just to check movements, I need to figure out how to remove it for the final product.
	def test_winning_move(board_class, marker, i)
	    # b = the board
	    # mark = 0 or X
	    # i = the square to check if makes a win 
	    b_copy = board_copy(board_class)
	    b_copy[i] = marker
	    board_class.update_board_with_position(marker,i)
	    return board_class.win
	end

def getComputerMove(board_class, i)
	b = board_class.board

    # Check computer win moves
    for i in (0..@size**2)
        if b[i.to_s] == i
            return i
        end
    end

    # # Check player win moves
    for i in (0..@size**2)
    	p i
        if b[i.to_s] == i
            return i
        end
    end

    # Play a corner
    for i in [0, 2, 6, 8] do
        if b[i.to_s] == i
            return i
        end
    end

    # Play center
    if b[i.to_s] == 4
    	p i
        return 4
    end

    #Play a side
    for i in [1, 3, 5, 7] do
        if b[i.to_s] == i
            return i
    	end
    end
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
		p player.player
		if player.player == "o"
			x_array
		elsif player.player == "x"
			o_array
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