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
		# p testing

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
		testing = unbeatable.side_position(board)
		# p testing

		assert_equal([2,4,6,8], testing)
	end

	def test_side2
		unbeatable = Unbeatable_ai.new(5,"o")
		board = Tictac_board.new(5)
		testing = unbeatable.side_position(board)
		# p testing

		assert_equal([2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24], testing)
		# [2,3,4,6,10,11,15,16,20,22,23,24]
	end


end