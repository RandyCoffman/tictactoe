require "minitest/autorun"
require_relative "tictac_player.rb"

class Tictac_player_test < Minitest::Test

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

    def test_player
        player = TicTac_player.new
        player_x = player.player

        assert_equal("x", player_x)
    end

    def test_change_icon
        player_x = TicTac_player.new
        player_x.change_icon()
        player_o = player_x.player

        assert_equal("o", player_o)
    end

    def test_change_icon2
        player_x = TicTac_player.new
        player_x.change_icon
        player_x.change_icon
        player = player_x.player

        assert_equal("x", player)
    end

    def test_change_icon3
        player_x = TicTac_player.new
        player_x.change_icon
        player_x.change_icon
        player_x.change_icon
        player_o = player_x.player

        assert_equal("o", player_o)
    end

end