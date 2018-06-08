require 'sinatra'
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "tictac_board.rb"
require_relative "tictac_player.rb"
require_relative "app_functions.rb"

enable :sessions

get "/" do
	session[:counter] = 1
    session[:board] = Tictac_board.new(3)
    session[:player] = TicTac_player.new
    session[:outcome] = ""
    redirect "/player-selection"
end

post "/post-size" do
	redirect "/player-selection"
end

get "/player-selection" do
	erb :page2_player_selection
end

post "/post-player-selection" do
	session[:players] = params[:players]
	p session[:players]
	session[:p1_p2] = params[:p1_p2]
	if session[:p1_p2] == "1"
		"player is x"
	else 
		"player is y"
	end
	size = session[:size]
	if session[:players] == "0" || session[:players] == "1"
		redirect "/ai-difficulty-selection"
	else
		redirect "/player-vs-player"
	end	
end

get "/ai-difficulty-selection" do
	players = session[:players].to_s
	erb :page3_ai_difficulty_selection, locals:{players:players}
end

post "/post-start-game" do
	if session[:players] == "0"
		session[:difficulty1] = params[:difficulty1]
		session[:difficulty2] = params[:difficulty2]
		redirect "/ai_vs_ai"

	else
		session[:difficulty1] = params[:difficulty1]
		redirect "/player_vs_ai"
	end
end

get "/player-vs-player" do
	error = session[:error]
	game_board = session[:board]
	session[:player]
	player = session[:player]
	erb :page4_player_vs_player_board, locals:{player:player,game_board:game_board,error:error}
end

post "/post-player-vs-player" do
	if session[:board].valid_position?(params[:move].to_i) == true
		session[:board].update_board_with_position(session[:player].player,params[:move].to_i)
	else
		session[:error] = "Invalid move"
		redirect "/player-vs-player"
	end
	session[:error] = ""
	if session[:board].winner_or_loser?()
            session[:outcome] = "Player #{session[:player].player} wins!"
            redirect "/outcome"
    elsif session[:board].board_full? == false
            session[:outcome] = "Tie!"
            redirect "/outcome"
    end
	session[:player].change_icon
	redirect "/player-vs-player"
end

get "/player_vs_ai" do
	error = session[:error]
	game_board = session[:board]
	p1_p2 = session[:p1_p2]
	player = session[:player]
	difficulty1 = session[:difficulty1]
	if p1_p2 == "2" && session[:counter].odd?
		session[:ai_move] = choose_ai(size=3,player.player,difficulty1).choice(game_board,player)
		session[:counter] = session[:counter] + 1
		p session[:ai_move]
		redirect "/post_player_vs_ai"
	elsif p1_p2 == "1" && session[:counter].even?
		session[:ai_move] = choose_ai(size=3,player.player,difficulty1).choice(game_board,player)
		session[:counter] = session[:counter] + 1
		redirect "/post_player_vs_ai"
	end

	erb :page5_player_vs_ai, locals:{player:player,difficulty1:difficulty1,game_board:game_board,error:error}
end

get "/post_player_vs_ai" do
	session[:board].update_board_with_position(session[:player].player,session[:ai_move].to_i)
	if session[:board].winner_or_loser?()
            session[:outcome] = "Player #{session[:player].player} wins!"
            redirect "/outcome"
    elsif session[:board].board_full? == false
            session[:outcome] = "Tie!"
            redirect "/outcome"
    end
	session[:player].change_icon
	redirect "/player_vs_ai"
end

post "/post_player_vs_ai" do
	if session[:board].valid_position?(params[:move].to_i) == true
		session[:board].update_board_with_position(session[:player].player,params[:move].to_i)
	else
		session[:error] = "Invalid move"
		redirect "/player_vs_ai"
	end
	session[:error] = ""
	if session[:board].winner_or_loser?()
            session[:outcome] = "Player #{session[:player].player} wins!"
            redirect "/outcome"
    elsif session[:board].board_full? == false
            session[:outcome] = "Tie!"
            redirect "/outcome"
    end
    session[:counter] = session[:counter] + 1
	session[:player].change_icon
	redirect "/player_vs_ai"
end

get "/ai_vs_ai" do
	game_board = session[:board]
	player = session[:player]
	difficulty1 = session[:difficulty1]
	difficulty2 = session[:difficulty2]
	if session[:counter].odd?
		session[:ai_move] = choose_ai(size=3,player.player,difficulty1).choice(game_board,player)
		redirect "/post_ai_vs_ai"
	elsif session[:counter].even?
		session[:ai_move] = choose_ai(size=3,player.player,difficulty2).choice(game_board,player)
		redirect "/post_ai_vs_ai"
	end
	erb :page6_ai_vs_ai, locals:{player:player,difficulty1:difficulty1,difficulty2:difficulty2,game_board:game_board}
end

get "/post_ai_vs_ai" do
	session[:board].update_board_with_position(session[:player].player,session[:ai_move].to_i)
	session[:error] = ""
	if session[:board].winner_or_loser?()
            session[:outcome] = "Player #{session[:player].player} wins!"
            redirect "/outcome"
    elsif session[:board].board_full? == false
            session[:outcome] = "Tie!"
            redirect "/outcome"
    end
    session[:counter] = session[:counter] + 1
	session[:player].change_icon
	redirect "/ai_vs_ai"
end

get "/outcome" do
	outcome = session[:outcome]
	game_board = session[:board]
	erb :outcome, locals:{outcome:outcome,game_board:game_board}
end
