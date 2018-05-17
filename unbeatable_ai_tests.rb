require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "tictac_board.rb"

class Tictac_unbeatable_ai_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

	def test_available_spots
		unbeatable = Unbeatable_ai.new(4,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
		testing = unbeatable.moves_available(board)
		p testing

		assert_equal([4, 7, 9], testing)
	end

	def test_available_spots2
		unbeatable = Unbeatable_ai.new(4,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>"o","2"=>"x","3"=>3,"4"=>4,"5"=>"o","6"=>6,"7"=>7,"8"=>8,"9"=>9}
		testing = unbeatable.moves_available(board)
		p testing

		assert_equal([3, 4, 6, 7, 8, 9], testing)
	end

	def test_available_spots3
		unbeatable = Unbeatable_ai.new(4,"o")
		board = Tictac_board.new(3)
		board.board = {"1"=>1,"2"=>2,"3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
		testing = unbeatable.moves_available(board)
		p testing

		assert_equal([1, 2, 4, 7, 9], testing)
	end

end