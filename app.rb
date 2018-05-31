require 'sinatra'

enable :sessions

get "/" do
	erb :page1_board_size
end

post "/post-size" do
	session[:size] = params[:size]
	p session[:size]
end