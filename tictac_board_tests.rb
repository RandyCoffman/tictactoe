require "minitest/autorun"
require_relative "tictac_board.rb"

class Tictac_board_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true,true)
	end

    def test_board_generator_9
        tictac = Tictac_board.new(3)
        board = tictac.board
        p board

        assert_equal(9, board.length)
    end

    def test_board_generator_36
        tictac = Tictac_board.new(6)
        board = tictac.board

        assert_equal(36, board.length)
    end

    def test_board_generator_81
        tictac = Tictac_board.new(9)
        board = tictac.board

        assert_equal(81, board.length)
    end
end
