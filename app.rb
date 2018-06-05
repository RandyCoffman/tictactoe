require 'sinatra'
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "tictac_board.rb"
require_relative "tictac_player.rb"

enable :sessions

get "/" do
	erb :page1_board_size
end

post "/post-size" do
	session[:size] = params[:size]
	size = session[:size].to_i
	redirect "/player-selection"
end

get "/player-selection" do
	erb :page2_player_selection
end

post "/post-player-selection" do
	session[:players] = params[:players]
	while params[:p1_marker] == nil
		params[:p1_marker] = "x"
	end
	if params[:p1_marker] == "x"
		session[:p2_marker] = "y"
	else 
		session[:p2_marker] = "x"
	end
	session[:p1_marker] = params[:p1_marker]
	size = session[:size]
	if session[:players] == "0" || session[:players] == "1"
		redirect "/ai-difficulty-selection"
	else
		redirect "/player-vs-player"
	end	
end

get "/ai-difficulty-selection" do
	players = session[:players].to_s
	p1_marker = session[:p1_marker]
	p2_marker = session[:p2_marker]
	erb :page3_ai_difficulty_selection, locals:{p1_marker:p1_marker, p2_marker:p2_marker,players:players}
end

get "/player-vs-player" do
	size = session[:size].to_i
	erb :page4_board, locals:{size:size}
end