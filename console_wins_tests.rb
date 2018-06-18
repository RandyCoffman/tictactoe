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
		1000.times do
			console_game
			if console_game != "Player x wins!" || console_game != "Player o wins!"
				puts "tie"
				tie_counter += 1
			elsif console_game == "Player x wins!"
				puts "x wins"
				x_wins += 1
			else
				p "#{console_game}"
				o_wins += 1
			end
			p "ties #{tie_counter}"
			p "player x won this many times #{x_wins}"
			p "random things returning #{o_wins}"
		end
	end

end