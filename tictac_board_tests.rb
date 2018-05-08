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

    def test_board_full?
    	tictac = Tictac_board.new(3)
    	full = tictac.board_full?

    	assert_equal(true, full)
    end

    def test_board_empty
    	tictac = Tictac_board.new(0)
    	full = tictac.board_full?

    	assert_equal(false, full)
    end

    def test_for_valid_spot_valid
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        validation = tictac.valid_position?(3)

        assert_equal(true, validation)
    end

    def test_for_valid_spot_valid2
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        validation = tictac.valid_position?(7)

        assert_equal(true, validation)
    end

    def test_for_valid_spot_valid3
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        validation = tictac.valid_position?(8)

        assert_equal(true, validation)
    end

    def test_for_valid_spot_invalid
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>"x","2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        validation = tictac.valid_position?(1)

        assert_equal(false, validation)
    end

    def test_for_valid_spot_invalid2
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>"x","6"=>6,"7"=>7,"8"=>8,"9"=>9}
        validation = tictac.valid_position?(5)

        assert_equal(false, validation)
    end

    def test_for_valid_spot_invalid3
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>"o"}
        validation = tictac.valid_position?(9)

        assert_equal(false, validation)
    end

	def test_for_winner
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>1,"2"=>2,"3"=>"x","4"=>4,"5"=>5,"6"=>"x","7"=>7,"8"=>8,"9"=>"x"}
        winner = tictac.winner_or_loser?

        assert_equal(true, winner)
    end

	def test_for_winner2
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>"o","2"=>"o","3"=>"o","4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        winner = tictac.winner_or_loser?

        assert_equal(true, winner)
    end

	def test_for_loser
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9}
        winner = tictac.winner_or_loser?

        assert_equal(false, winner)
    end

	def test_for_loser2
        tictac = Tictac_board.new(3)
        tictac.board = {"1"=>"o","2"=>"x","3"=>"o","4"=>4,"5"=>"o","6"=>"x","7"=>7,"8"=>"x","9"=>9}
        winner = tictac.winner_or_loser?

        assert_equal(false, winner)
    end

    def test_for_valid_input
        tictac = Tictac_board.new(3)
        valid = tictac.valid_position_input?(1)

        assert_equal(true, valid)
    end  

    def test_for_valid_input2
        tictac = Tictac_board.new(5)
        valid = tictac.valid_position_input?(10)

        assert_equal(true, valid)
    end  

    def test_for_invalid_input
        tictac = Tictac_board.new(3)
        valid = tictac.valid_position_input?(10)
        
        assert_equal(false, valid)
    end

    def test_for_invalid_input2
        tictac = Tictac_board.new(5)
        valid = tictac.valid_position_input?(26)
        
        assert_equal(false, valid)
    end

    def test_for_updating_position
        tictac = Tictac_board.new(3)
        position = tictac.update_board_with_position("x", 2)
        
        assert_equal("x", position)
    end

    def test_for_updating_position2
        tictac = Tictac_board.new(3)
        position = tictac.update_board_with_position("o", 7)
        
        assert_equal("o", position)
    end

    def test_for_updating_position3
        tictac = Tictac_board.new(2)
        position = tictac.update_board_with_position("x", 9)
        
        assert_equal("x", position)
    end

end
