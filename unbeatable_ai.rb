require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)
		# take_corner_spot_if_middle_is_chosen(board_class,player)
		# take_opposite_corner(board_class,player)
		# take_middle_if_first(board_class)
		# take_win_if_available_player_x(board_class)
		create_fork_for_x(board_class)
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

	def take_opposite_corner(board_class)
		if corner_position(board_class).include?(spot_chosen_by_x(board_class).last) == true
			move = spot_chosen_by_x(board_class).last
			corner_hash = {1 => 9, 3 => 7, 7 => 3, 9 =>1}
			corner_hash[move]
		elsif corner_position(board_class).include?(spot_chosen_by_o(board_class).last) == true
			move = spot_chosen_by_o(board_class).last
			corner_hash = {1 => 9, 3 => 7, 7 => 3, 9 =>1}
			corner_hash[move]
		end
	end

	def take_middle_if_first(board_class)
		if spot_chosen_by_x(board_class).empty? == true
			middle_position(board_class).to_i
		elsif spot_chosen_by_o(board_class).empty? == true
			middle_position(board_class).to_i
		end
	end

	def take_win_if_available_player_x(board_class)
		for each_element in board_class.win
			x_matches = each_element & spot_chosen_by_x(board_class)
			if x_matches.count == @size - 1
				x_win = each_element - x_matches
				if board_class.valid_position?(x_win.join.to_i) == true
					p x_win.join.to_i
					return x_win.join.to_i
				end
			end
		end
		"no win"
	end

	def take_win_if_available_player_o(board_class)
		for each_element in board_class.win
			o_matches = each_element & spot_chosen_by_o(board_class)
			if o_matches.count == @size - 1
				o_win = each_element - o_matches
				if board_class.valid_position?(o_win.join.to_i) == true
					return o_win.join.to_i
				end
			end
		end
		"no win"
	end

	def take_win(board_class,player)
		if player.player == "x"	
			take_win_if_available_player_x(board_class)
		elsif player.player == "o"
			take_win_if_available_player_o(board_class)
		end
	end

	def block_win(board_class,player)
		if player.player == "x"	
			take_win_if_available_player_o(board_class)
		elsif player.player == "o"
			take_win_if_available_player_x(board_class)
		end
	end

	def create_fork_for_x(board_class)
		fork_array = []
		for each_element in board_class.win
			x_matches = each_element & spot_chosen_by_x(board_class)
			x_fork = each_element - x_matches
			if x_fork.count == @size - 1
			fork_array << x_fork
			fork_array.each { |fork|
				real_fork = fork & x_fork
				if real_fork.count == 1 && board_class.valid_position?(real_fork.join.to_i)
					return real_fork.join.to_i
				end
			}
			end
		end
		"no fork"
	end

	def create_fork_for_o(board_class)
		fork_array = []
		for each_element in board_class.win
			o_matches = each_element & spot_chosen_by_o(board_class)
			o_fork = each_element - o_matches
			if o_fork.count == @size - 1
			fork_array << o_fork
			fork_array.each { |fork|
				real_fork = fork & o_fork
				if real_fork.count == 1 && board_class.valid_position?(real_fork.join.to_i)
					return real_fork.join.to_i
				end
			}
			end
		end
		"no fork"
	end

	def create_forks(board_class,player)
		if player.player == "x"
			create_fork_for_x(board_class)
		elsif player.player == "o"
			create_fork_for_o(board_class)
		end
	end

	def block_fork(board_class,player)
		if player.player == "o"
			create_fork_for_x(board_class)
		elsif player.player == "x"
			create_fork_for_o(board_class)
		end
	end

end