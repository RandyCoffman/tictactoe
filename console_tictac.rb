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
    counter = 0
    outcome = " "
    until outcome != " "
        p "Player '#{player.player}' turn!"
        game_board.print_board()
        if player_array[(counter % 2)] == "player"
           choice = player_move(game_board)
        else
           choice = player_array[(counter % 2)].choice(game_board,player)
        end
        game_board.update_board_with_position(player.player,choice)
        if game_board.winner_or_loser?()
            outcome = "Player #{player.player} wins!"
        elsif game_board.board_full? == false
            outcome = "Tie!"
        end
        player.change_icon()
        counter += 1
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
        p "Invalid move"
        player_move(game_board)
    end
end

def choose_ai(player,size,marker)
    if player == "ai 1"
        Random_ai.new(size,marker)
    elsif player == "ai 2"
        Sequential_ai.new(size,marker)
    elsif player == "ai 3"
        Unbeatable_ai.new(size,marker)
    else
        player
    end
end



def preamble()
    size = board_size()
    choice = how_many()
    if choice == "0"
        player1 = difficulty(size,"x")
        player2 = difficulty(size,"o")
    elsif choice == "1"
        if first?()
            player1 = "player"
            player2 = difficulty(size,"o")
        else
            player1 = difficulty(size,"x")
            player2 = "player"
        end
    else
        player1 = "player"
        player2 = "player"
    end
    # Player array lists the players and the size of the board
    [player1, player2, size.to_i]
end

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

def board_size()
    p "What board size would you want? 3-5 are valid choices, 3 is a normal 3 by 3 board"
    choice = gets.chomp
    if choice.to_i > 2 && choice.to_i < 6
        choice.to_i
    else
    	p "wrong size choice"
        board_size()
    end
end

def difficulty(size,marker)
    p "1 is easy, 2 is medium and 3 is unbeatable difficulty"
    choice = gets.chomp
    if ["3", "1", "2"].include?(choice) 
        choose_ai("ai " + choice,size,marker)
    else
        p "Incorrect Input"
        difficulty(size,marker)
    end
end


def how_many()
    p  "How many player 0:1:2"
    choice = gets.chomp
    if ["0", "1", "2"].include?(choice) 
        choice
    else
        p "Incorrect Input"
        how_many()
    end
end

console_game()