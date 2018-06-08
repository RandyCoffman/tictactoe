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
		counter = 0
		1000.times do
			console_game
			p counter
			if console_game == "Tie!"
				counter += 1
			end
			if counter == 1000
				p counter
			end
		end
	end

end