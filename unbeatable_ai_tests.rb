require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

class Tictac_unbeatable_ai_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

	def test_spots_taken_by_o
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
		testing = unbeatable.spot_chosen_by_x(board)
		# p testing

		assert_equal([2, 6, 8], testing)
	end

	def test_spots_taken_by_o2
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>"x","4"=>4,"5"=>"x","6"=>"o","7"=>7,"8"=>"x","9"=>"x"}
		testing = unbeatable.spot_chosen_by_x(board)
		# p testing

		assert_equal([2, 3, 5, 8, 9], testing)
	end

	def test_spots_taken_by_o3
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>"x","4"=>"o","5"=>"o","6"=>"x","7"=>"o","8"=>"x","9"=>9}
		testing = unbeatable.spot_chosen_by_x(board)
		# p testing

		assert_equal([2, 3, 6, 8], testing)
	end

	def test_spots_taken_by_x
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.spot_chosen_by_o(board)
		# p testing

		assert_equal([1,5], testing)
	end

	def test_spots_taken_by_x2
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>2,"3"=>"o","4"=>4,"5"=>"o","6"=>"o","7"=>7,"8"=>"x","9"=>9}
		testing = unbeatable.spot_chosen_by_o(board)
		# p testing

		assert_equal([1, 3, 5, 6], testing)
	end

	def test_spots_taken_by_x3
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>1,"2"=>"o","3"=>"o","4"=>4,"5"=>"o","6"=>"o","7"=>7,"8"=>"x","9"=>"o"}
		testing = unbeatable.spot_chosen_by_o(board)
		# p testing

		assert_equal([2, 3, 5, 6, 9], testing)
	end

	def test_corners
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		testing = unbeatable.corner_position(board)
		p testing

		assert_equal([1, 3, 7, 9], testing)
	end

	def test_corners2
		unbeatable = Unbeatable_ai.new(5,"o")
		board = Tictac_board.new(5)
		testing = unbeatable.corner_position(board)
		# p testing

		assert_equal([1, 5, 21, 25], testing)
	end

	def test_corners3
		unbeatable = Unbeatable_ai.new(7,"o")
		board = Tictac_board.new(7)
		testing = unbeatable.corner_position(board)
		# p testing

		assert_equal([1, 7, 43, 49], testing)
	end

	def test_corners4
		unbeatable = Unbeatable_ai.new(9,"o")
		board = Tictac_board.new(9)
		testing = unbeatable.corner_position(board)
		# p testing

		assert_equal([1, 9, 73, 81], testing)
	end

	def test_middle
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		testing = unbeatable.middle_position(board)
		# p testing

		assert_equal("5", testing)
	end

	def test_middle2
		unbeatable = Unbeatable_ai.new(5,"o")
		board = Tictac_board.new(5)
		testing = unbeatable.middle_position(board)
		# p testing

		assert_equal("13", testing)
	end

	def test_middle3
		unbeatable = Unbeatable_ai.new(7,"o")
		board = Tictac_board.new(7)
		testing = unbeatable.middle_position(board)
		# p testing

		assert_equal("25", testing)
	end

	def test_middle4
		unbeatable = Unbeatable_ai.new(9,"o")
		board = Tictac_board.new(9)
		testing = unbeatable.middle_position(board)
		# p testing

		assert_equal("41", testing)
	end

	def test_side
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		testing = unbeatable.get_side_positions(board)
		# p testing

		assert_equal([2,4,6,8], testing)
	end

	def test_side2
		unbeatable = Unbeatable_ai.new(5,"o")
		board = Tictac_board.new(5)
		testing = unbeatable.get_side_positions(board)
		# p testing

		assert_equal([2,3,4,6,10,11,15,16,20,22,23,24], testing)
	end

	def test_side3
		unbeatable = Unbeatable_ai.new(9,"o")
		board = Tictac_board.new(9)
		testing = unbeatable.get_side_positions(board)
		# p testing

		assert_equal([2,3,4,5,6,7,8,10,18,19,27,28,36,37,45,46,54,55,63,64,72,74,75,76,77,78,79,80], testing)
	end

	def test_taking_corner
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_corner_spot_if_middle_is_chosen(board,player)
		board.update_board_with_position(player.player,testing)
		p "#{testing} this is the corner for test_taking_corner. 3x3 board. random corner taking, so may fail sometimes"

		assert_equal({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>"o", "6"=>6, "7"=>"x", "8"=>8, "9"=>9}, board.board)
	end

	def test_taking_corner2
		unbeatable = Unbeatable_ai.new(5,"x")
		board = Tictac_board.new(5)
		player = TicTac_player.new
		board.update_board_with_position("o",13)
		testing = unbeatable.take_corner_spot_if_middle_is_chosen(board,player)
		board.update_board_with_position(player.player,testing)
		p "#{testing} this is the corner for test_taking_corner2. 5x5 board. random corner taking, so may fail sometimes"

		assert_equal({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>"x", "6"=>6, "7"=>7, "8"=>8, "9"=>9, "10"=>10, "11"=>11, "12"=>12, "13"=>"o", "14"=>14, "15"=>15, "16"=>16, "17"=>17, "18"=>18, "19"=>19, "20"=>20, "21"=>21, "22"=>22, "23"=>23, "24"=>24, "25"=>25}, board.board)
	end

	def test_taking_opposite_corner
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_opposite_corner(board)
		board.update_board_with_position(player.change_icon,testing)
		# p board.board
		# p "testing board for taking opposite corners"
		assert_equal(9,testing)
	end

	def test_taking_opposite_corner2
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>1,"2"=>2,"3"=>"o","4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_opposite_corner(board)
		board.update_board_with_position(player.player,testing)
		# p board.board
		# p "testing board for taking opposite corners2"
		assert_equal(7,testing)
	end

	def test_taking_middle_first
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_middle_if_first(board,player)
		board.update_board_with_position(player.player,testing)
		assert_equal(5,testing)
	end

	def test_taking_middle_first2
		unbeatable = Unbeatable_ai.new(5,"x")
		board = Tictac_board.new(5)
		player = TicTac_player.new
		testing = unbeatable.take_middle_if_first(board,player)
		board.update_board_with_position(player.player,testing)
		assert_equal(13,testing)
	end

	def test_taking_middle_first3
		unbeatable = Unbeatable_ai.new(7,"x")
		board = Tictac_board.new(7)
		player = TicTac_player.new
		testing = unbeatable.take_middle_if_first(board,player)
		board.update_board_with_position(player.player,testing)
		assert_equal(25,testing)
	end

	def test_taking_winning_spot_x
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>"x","3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_x(board)
		p "winning spot 3"
		assert_equal(3,testing)
	end

	def test_taking_winning_spot_x2
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>"x","5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_x(board)
		p "winning spot 7"
		assert_equal(7,testing)
	end

	def test_taking_winning_spot_x3
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>"x","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_x(board)
		p "winning spot 9"
		assert_equal(9,testing)
	end

	def test_taking_winning_spot_o
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"o","2"=>"o","3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_o(board)
		assert_equal(3,testing)
	end

	def test_taking_winning_spot_o2
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"o","2"=>2,"3"=>3,"4"=>"o","5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_o(board)
		assert_equal(7,testing)
	end

	def test_taking_winning_spot_o3
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"o","2"=>2,"3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.take_win_if_available_player_o(board)
		assert_equal(9,testing)
	end

	def test_block_win
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		player.change_icon
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>"x","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.block_win(board,player)
		assert_equal(9,testing)
	end

	def test_block_win2
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"o","2"=>"o","3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.block_win(board,player)
		assert_equal(3,testing)
	end

	def test_block_win3
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		player.change_icon
		board.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>"x","8"=>8,"9"=>"x"}
		testing = unbeatable.block_win(board,player)
		assert_equal(8,testing)
	end

	def test_fork
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		player.change_icon
		board.board = {"1"=>"o","2"=>"x","3"=>3,"4"=>4,"5"=>"x","6"=>6,"7"=>"o","8"=>8,"9"=>9}
		testing = unbeatable.create_forks(board,player)
		assert_equal(9,testing)
	end

	def test_fork2
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>"o","3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>"x","8"=>8,"9"=>"x"}
		testing = unbeatable.create_forks(board,player)
		assert_equal(3,testing)
	end

	def test_fork3
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>7,"8"=>8,"9"=>"x"}
		testing = unbeatable.create_forks(board,player)
		assert_equal(3,testing)
	end

	def test_block_fork
		unbeatable = Unbeatable_ai.new(3,"o")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		player.change_icon
		board.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>"x","8"=>8,"9"=>"o"}
		testing = unbeatable.block_fork(board,player)
		assert_equal(3,testing)
	end

	def test_block_fork2
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		board.board = {"1"=>"x","2"=>"o","3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>"x","8"=>8,"9"=>"x"}
		testing = unbeatable.block_fork(board,player)
		assert_equal(3,testing)
	end

	def test_block_fork3
		unbeatable = Unbeatable_ai.new(3,"x")
		board = Tictac_board.new(3)
		player = TicTac_player.new
		player.change_icon
		board.board = {"1"=>"x","2"=>"o","3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>"x","8"=>8,"9"=>"x"}
		testing = unbeatable.block_fork(board,player)
		assert_equal(3,testing)
	end

	
end