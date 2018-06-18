require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "tictac_board.rb"
require_relative "tictac_player.rb"
require_relative "console_wins.rb"

class Tictac_console_test < Minitest::Test

	def self.test_order
 		:alpha
	end

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

	def test_unbeatable_vs_unbeatable_1000_times
		tie_counter = 0
		x_wins = 0
		o_wins = 0
		until tie_counter + x_wins == 1000
			console_game
			if console_game == "Tie!"
				tie_counter += 1
			elsif console_game == "Player x won!"
				x_wins += 1
			elsif console_game == "Player o won!"
				o_wins += 1
			end
			p "ties against eachother #{tie_counter}"
			p "player x won this many times #{x_wins}"
			p "player o won this many times (non-unbeatable function) #{o_wins}"
		end
	end

end