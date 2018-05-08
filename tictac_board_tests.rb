require "minitest/autorun"
require_relative "tictac_board.rb"

class Tictac_board < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true,true)
	end

	def test_board
		assert_equal(9, board.size)
	end
end
