require_relative "tictac_board.rb"
require_relative "tictac_player.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"



def console_game()
    player_arr = prelude
    size = player_arr.pop
    game_board = Tictac_board.new(size)
    player = TicTac_player.new()
    counter = 0
    outcome = " "
    until outcome != " "
        p "player '#{player.player}' turn"
        game_board.print_board()
        if player_arr[(counter % 2)] == "player"
           choice = player_move(game_board)
        else
           choice = player_arr[(counter % 2)].choice(game_board,player)
        end
        game_board.update_board_with_position(player.player,choice)
        if game_board.winner_or_loser?()
            outcome = "Player #{player.player} wins"
        elsif game_board.board_full? == false
            outcome = "Tie!"
        end
        player.change_icon()
        counter+=1
    end
    game_board.print_board
    p outcome
end


def player_move(game_board)
    p "Please select a position"
    choice = gets.chomp
    if game_board.valid_position_input?(choice.to_i)
        if game_board.valid_position?(choice.to_i)
            choice.to_i
        else
            p "That position has already been taken"
            player_move(game_board)
        end
    else
        p "Invalid move"
        player_move(game_board)
    end
end

def chose_ai(player,size,marke)
    if player == "ai 1"
        Random_ai.new(size,marke)
    elsif player == "ai 2"
        Sequential_ai.new(size,marke)
    elsif player == "ai 3"
        Ai.new(size,marke)
    else
        player
    end
end



def prelude()
    size = board_size()
    choice = how_many()
    if choice == "0"
        player1 = how_difficult(size,"x")
        player2 = how_difficult(size,"o")
    elsif choice == "1"
        if first?()
            player1 = "player"
            player2 = how_difficult(size,"o")
        else
            player1 = how_difficult(size,"x")
            player2 = "player"
        end
    else
        player1 = "player"
        player2 = "player"
    end
    [player1, player2, size.to_i]
end

def first?()
    p "Would you like to go first 'y' 'n'"
    choice = gets.chomp
    if choice == 'y'
        true
    elsif choice == "n"
        false
    else
        p "Incorrect Input"
        first?()
    end
end    

def board_size()
    p "What Size Board do You want 3-5"
    choice = gets.chomp
    if choice.to_i > 2 && choice.to_i < 6
        choice.to_i
    else
        board_size()
    end
end

def how_difficult(size,marker)
    p "1 is easy, 2 is medium and 3 is unbeatable difficulty"
    choice = gets.chomp
    if ["3", "1", "2"].include?(choice) 
        chose_ai("ai " + choice,size,marker)
    else
        p "Incorrect Input"
        how_many()
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