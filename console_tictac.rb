require_relative "tictac_board.rb"
require_relative "tictac_player.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "unbeatable_ai.rb"

def console_game()
    player_array = preamble
    size = player_array.pop
    game_board = Tictac_board.new(size)
    player = TicTac_player.new()
    player_counter = 0
    outcome = " "
    until outcome != " "
        p "Player '#{player.player}' turn!"
        game_board.print_board()
# player_counter is used to make sure the human player and ai player get to move or else the ai will have to be controlled
# counter works with modulus 2 since the first time and every other time it will be 0
# the second and every other time after that will be 1, which tells the game that it's the ai moving
        if player_array[(player_counter % 2)] == "player"
           choice = player_move(game_board)
        else
# Ai movement
           choice = player_array[(player_counter % 2)].choice(game_board,player)
        end
        game_board.update_board_with_position(player.player,choice)
        if game_board.winner_or_loser?()
            outcome = "Player #{player.player} wins!"
        elsif game_board.board_full? == false
            outcome = "Tie!"
        end
        player.change_icon()
        player_counter += 1
    end
    game_board.print_board
    p outcome
end


def player_move(game_board)
    p "Please select a position"
    choice = gets.chomp
    if game_board.valid_position?(choice.to_i)
        choice.to_i
    else
        p "Invalid move, please select another position"
        player_move(game_board)
    end
end

def choose_ai(player,size,marker)
    if player == "ai 1"
        Random_ai.new(size,marker)
    elsif player == "ai 2"
        Sequential_ai.new(size,marker)
    else player == "ai 3"
        Unbeatable_ai.new(size,marker)
    end
end

# ai vs ai
def no_human_players(size)
    @player1 = difficulty(size,"x")
    @player2 = difficulty(size,"o")
end

# player vs ai, if first? is true then player goes first and if not then player goes second
def human_player_and_ai(size)
	if first?()
        @player1 = "player"
        @player2 = difficulty(size,"o")
    else
        @player1 = difficulty(size,"x")
        @player2 = "player"
    end
end

# player vs player, player1 goes first, player2 goes second
def human_and_human_player(size)
	@player1 = "player"
    @player2 = "player"
end

# intro of the game
def preamble()
    size = board_size()
    choice = how_many_human_players()
    if choice == "0"
    	no_human_players(size)
    elsif choice == "1"
    	human_player_and_ai(size)
    else
    	human_and_human_player(size)
    end
# Player array lists the players and the size of the board
    [@player1, @player2, size.to_i]
end

# Sees if the player would like to go first or not
def first?()
    p "Would you like to go first? 'Yes' or 'No' are valid choices"
    choice = gets.chomp
    if choice.downcase == 'yes'
        true
    elsif choice.downcase == "no"
        false
    else
        p "Incorrect Input"
        first?()
    end
end    

# choice of the size of the board
def board_size()
    p "What board size would you want? odd numbers besides 1 are valid choices; 3 is a normal 3 by 3 board and 5 would make a 5 by 5 board."
    choice = gets.chomp
    if choice.to_i.odd? == true && choice.to_i > 1 && choice.to_i < 10
        choice.to_i
    else
    	p "wrong size choice"
        board_size()
    end
end

# Sets the ai difficulty
def difficulty(size,marker)
    p "1 is easy, 2 is medium, and 3 is unbeatable difficulty"
    choice = gets.chomp
    if ["1", "2", "3"].include?(choice) 
        choose_ai("ai " + choice,size,marker)
    else
        p "Incorrect Input"
        difficulty(size,marker)
    end
end

# Sets how many human players are interacting with the game
def how_many_human_players()
    p  "How many human players [0: ai vs ai 1: player vs ai, 2: player vs player]"
    choice = gets.chomp
    if ["0", "1", "2"].include?(choice) 
        choice
    else
        p "Incorrect Input"
        how_many_human_players()
    end
end

console_game()