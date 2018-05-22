require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "tictac_board.rb"
require_relative "tictac_player.rb"
require_relative "console_tictac.rb"

class Tictac_console_test < Minitest::Test

	def self.test_order
 		:alpha
	end

	def test_true_equals_true		#This is made to pass so I can establish a base
		assert_equal(true, true)
	end

	# def test_first_player_or_not?
	# 	assert_equal(false, first?())
	# end

	# def test_first_player_or_not2?
	# 	assert_equal(true, first?())
	# end

	# def test_how_many_players
	# 	players = how_many_human_players()
	# 	assert_equal("1", players)
	# end

	# def test_how_many_players2
	# 	players = how_many_human_players()
	# 	assert_equal("2", players)
	# end

	# def test_how_many_players3
	# 	players = how_many_human_players()
	# 	assert_equal("0", players)
	# end

	# def test_board_size
	# 	size = board_size
	# 	assert_equal(3,size)
	# end

	# def test_board_size2
	# 	size = board_size
	# 	assert_equal(5,size)
	# end

	# def test_preamble
	# 	start = preamble()
	# 	assert_equal("player",start[0])
	# end

	# def test_preamble2
	# 	start = preamble()
	# 	assert_equal(3,start[2])
	# end

	# def test_human_vs_human
	# 	players = human_and_human_player(3)
	# 	assert_equal("player",players)
	# end

	# def test_human_vs_ai
	# 	players = human_player_and_ai(3)
	# 	assert_equal("player",players)
	# end

	# def test_ai_vs_ai
	# 	ai = no_human_players(3)
	# 	refute_equal(3,ai)
	# end

	# def test_choose_ai
	# 	choose = choose_ai("ai 1",3,"x")
	# 	refute_equal(1,choose)
	# end

	# def test_player_move
	# 	tictac = Tictac_board.new(3)
	# 	move = player_move(tictac)

	# 	assert_equal(1,move)
	# end

	# def test_player_move2
	# 	tictac = Tictac_board.new(3)
	# 	move = player_move(tictac)

	# 	assert_equal(2,move)
	# end

	# def test_player_move3
	# 	tictac = Tictac_board.new(3)
	# 	move = player_move(tictac)

	# 	assert_equal(5,move)
	# end

	def test_console_tictac
		game = console_game

		assert_equal("Player x wins!",game)
	end
end