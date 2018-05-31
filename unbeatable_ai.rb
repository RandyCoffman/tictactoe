require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Unbeatable_ai

    def initialize(size,marker)
        @size = size
    end

	def choice(board_class,player)
		if take_win(board_class,player).class == Integer 
			return take_win(board_class,player)
		elsif block_win(board_class,player).class == Integer
			return block_win(board_class,player)
		elsif create_forks(board_class,player).class == Integer
			return create_forks(board_class,player)
		elsif block_fork(board_class,player).class == Integer
			return block_fork(board_class,player)
		elsif take_middle_if_first(board_class,player).class == Integer
			return take_middle_if_first(board_class,player)
		elsif take_corner_spot_if_middle_is_chosen(board_class,player).class == Integer
			return take_corner_spot_if_middle_is_chosen(board_class,player)
		elsif take_opposite_corner(board_class).class == Integer
			return take_opposite_corner(board_class)
		elsif side_position(board_class).class == Integer
			return side_position(board_class)
		else
			return random(board_class,player)
		end
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
		return x_array
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
		return o_array
	end

	def corner_position(board_class)
		board = board_class.board
		corner_array = []
		board.each_pair { |key,value|
			if key.to_i == 1 || key.to_i == @size || key.to_i == @size * (@size-1) + 1 || key.to_i == @size**2
				corner_array.push(key.to_i)
				return corner_array
			end
		}
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
 		p side_array
 		return side_array
	end

	def take_corner_spot_if_middle_is_chosen(board_class,player)
		if player.player == "o"
			if spot_chosen_by_x(board_class).last == middle_position(board_class).to_i
				move = corner_position(board_class)
				move = move.sample
				while board_class.valid_position?(move) == false
       				take_corner_spot_if_middle_is_chosen(board_class,player)
       			end
       			return move.to_i
			end
		elsif player.player == "x" 
			if spot_chosen_by_o(board_class).last == middle_position(board_class).to_i
				move = corner_position(board_class)
				move = move.sample
				while board_class.valid_position?(move) == false
       				take_corner_spot_if_middle_is_chosen(board_class,player)
       			end
       			return move.to_i
			end
			"no corner"
		end
	end

	def take_opposite_corner(board_class)
		if corner_position(board_class).include?(spot_chosen_by_x(board_class).last) == true
			move = spot_chosen_by_x(board_class).last
			corner_hash = {1 => @size**2, @size => @size*(@size-1), @size*(@size-1) => @size, @size**2 =>1}
			corner_hash[move]
		elsif corner_position(board_class).include?(spot_chosen_by_o(board_class).last) == true
			move = spot_chosen_by_o(board_class).last
			corner_hash = {1 => @size**2, @size => @size*(@size-1), @size*(@size-1) => @size, @size**2 =>1}
			corner_hash[move]
		end
	end

	def take_middle_if_first_x(board_class,player)
		if spot_chosen_by_o(board_class).empty? == true && board_class.valid_position?(middle_position(board_class).to_i)
			return middle_position(board_class).to_i
		end
	end

	def take_middle_if_first_o(board_class,player)
		if spot_chosen_by_x(board_class).empty? == true && board_class.valid_position?(middle_position(board_class).to_i)
			return middle_position(board_class).to_i
		end
	end

	def take_middle_if_first(board_class,player)
		if player.player == "o"
			take_middle_if_first_x(board_class,player)
		elsif player.player == "x"
			take_middle_if_first_o(board_class,player)
		end
	end

	def take_win_if_available_player_x(board_class)
		for each_element in board_class.win
			x_matches = each_element & spot_chosen_by_x(board_class)
			if x_matches.count == @size - 1
				x_win = each_element - x_matches
				if board_class.valid_position?(x_win.join.to_i) == true
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
				if real_fork.count == 1 && board_class.valid_position?(real_fork.join.to_i) == true
					return real_fork.join.to_i
				end
			}
			end
			"no fork"
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
				if real_fork.count == 1 && board_class.valid_position?(real_fork.join.to_i) == true
					return real_fork.join.to_i
				end
			}
			end
			"no fork"
		end
		"no fork"
	end

	def create_forks(board_class,player)
		if player.player == "o"
			create_fork_for_x(board_class)
		elsif player.player == "x"
			create_fork_for_o(board_class)
		end
	end

	def block_fork(board_class,player)
		if player.player == "x"
			create_fork_for_x(board_class)
		elsif player.player == "o"
			create_fork_for_o(board_class)
		end
	end

    def random(board_class,player)
        board = board_class.board
       	move = rand(1..@size**2)
       	if board_class.valid_position?(move) == false
       		random(board_class,player)
       	else
       		move
       	end
    end

end