require "minitest/autorun"
require_relative "random_ai.rb"
require_relative "tictac_board.rb"

class Tictac_random_ai_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

	def test_random_ai
		random = Random_ai.new(3,"y")
		board = Tictac_board.new(3)
		testing = random.choice(board, "random_ai")

		assert_equal(Integer, testing.class)
	end

	def test_random_ai_position_testing
	random = Random_ai.new(3,"o")
	board = Tictac_board.new(3)
	testing = random.choice(board, "random_ai")
	valid = board.valid_position?(testing)

	assert_equal(true, valid)
	end

	def test_random_ai_position_testing2
	random = Random_ai.new(4,"o")
	board = Tictac_board.new(3)
	board.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
	testing = random.choice(board, "random_ai")
	p testing
	valid = board.valid_position?(testing)

	assert_equal(true, valid)
	end

	def test_random_ai_position_testing3
	random = Random_ai.new(4,"o")
	board = Tictac_board.new(3)
	board.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
	testing = random.choice(board, "random_ai")
	p testing
	valid = board.valid_position_input?(testing)
	p valid

	assert_equal(true, valid)
	end

end