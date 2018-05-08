require "minitest/autorun"
require_relative "tictac_board.rb"

class Tictac_board_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true,true)
	end

    def test_board_generator_9
        tictac = Tictac_board.new(3)
        board = tictac.board

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

    def test_for_winner_row_1
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[0], [1, 2, 3])
    end

    def test_for_winner_row_2
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[1], [4, 5, 6])
    end

    def test_for_winner_row_3
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[2], [7, 8, 9])
    end

    def test_for_winner_col_1
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[3], [1, 4, 7])
    end

    def test_for_winner_col_2
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[4], [2, 5, 8])
    end

    def test_for_winner_col_3
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[5], [3,6,9])
    end

    def test_for_winner_diag_1
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[6], [1, 5, 9])
    end

    def test_for_winner_diag_2
        tictac = Tictac_board.new(3)
        winner = tictac.win

        assert_equal(winner[7], [3, 5, 7])
    end

end
