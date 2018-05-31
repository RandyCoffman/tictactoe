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
	session[:p1_marker] = params[:p1_marker]
	size = session[:size]
	p session[:p1_marker]
end
