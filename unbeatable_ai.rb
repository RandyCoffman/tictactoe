require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)
		take_corner_spot_if_middle_is_chosen(board_class,player)
# not putting anything in here officially until I get all my rules laid out and can figure out how it can make choices based on the rules
	end

# identifies the spots that are filled with the marker "x"
	def spot_chosen_by_x(board_class)
		board = board_class.board
		x_array = []
		board.each_pair { |key,value|
			if value == "x"
				x_array.push(key.to_i)
			end
			}
		x_array
	end

# identifies the spots that are filled with the marker "o"
	def spot_chosen_by_o(board_class)
		board = board_class.board
		o_array = []
		board.each_pair { |key,value|
			if value == "o"
				o_array.push(key.to_i)
			end
			}
		o_array
	end

	def corner_position(board_class)
		board = board_class.board
		corner_array = []
		board.each_pair { |key,value|
			if key.to_i == 1 || key.to_i == @size || key.to_i == @size * (@size-1) + 1 || key.to_i == @size**2
				corner_array.push(key.to_i)
			end
		}
		corner_array
	end

	def middle_position(board_class)
		board = board_class.board
		middle_array = []
		board.each_pair { |key,value|
				middle_array.push(key.to_i)
		}
		middle = (middle_array.length/2) + 1
		middle.to_s
	end

	def side_position(board_class)
		board = board_class.board
		side_array = *(1..@size)
		counter = 1
		@size.times do
			side_array << ((@size * counter))
			side_array << ((@size * counter) + 1)
			counter = counter + 1
		end
		side_array << (@size*(@size-1)..(@size**2)).to_a
		side_array.flatten!
		side_array.uniq!
		side_array.delete_if { |x| x > @size**2}
		side_array = side_array - corner_position(board_class)
		side_array
	end

	def take_corner_spot_if_middle_is_chosen(board_class,player)
		if player.player == "o"
			if spot_chosen_by_x(board_class).last == middle_position(board_class).to_i
				move = corner_position(board_class)
				move = move.sample
				while board_class.valid_position?(move) == false
       				take_corner_spot_if_middle_is_chosen(board_class,player)
       			end
       			move
			end
		elsif player.player == "x" 
			if spot_chosen_by_o(board_class).last == middle_position(board_class).to_i
				move = corner_position(board_class)
				move = move.sample
				while board_class.valid_position?(move) == false
       				take_corner_spot_if_middle_is_chosen(board_class,player)
       			end
       			move
			end
		end
	end

end