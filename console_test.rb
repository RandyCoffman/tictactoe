def how_many_players
    num = " "
    p "how many players 1:2"
    until num != " "
        num = gets.chomp
        # num = "0"
        if num == "1"
            num = "1"
        elsif num == "2"
            num = "2"
        elsif num == "0"
            num = "0"
        else
            num = " "
            p "not a valid choice"
        end
    end
    num
end

def choose_ai
        p "difficulty 1:random, 2:sequential, 3:Unbeatable"
            ai = " "
        until ai != ' ' do
            ai = gets.chomp
            # ai = "3"
            if ai == "1"
                ai = Random_ai.new
            elsif ai == "2"
                ai = Sequential_ai.new
            elsif ai == "3"
                ai = Unbeatable_ai.new
            else
               choose_ai()
            end
        end
    ai
end

def first_or_second
    p "would you like to go first(y/n)"
    choice = " "    
    until choice != " " do
        choice = gets.chomp.downcase
        if choice == "y"
           choice = "player"
        elsif choice == "n"
           choice = "ai"
        else
           first_or_second()
        end
    end
    choice
end

def game
    board = Tictac_board.new
    player_class = Tictac_player.new
    board_size = board.board
    num =  how_many_players
    game = "start"
    ai = ""
    ai_2 = ""
    order = ""
    if num == "1"
        ai = choose_ai
       
        if  first_or_second == "player"
            order = {"o" => "ai", "x" => "player"}
        else
            order = {"o" => "player", "x" => "ai"}        
        end
    elsif num == "2"
        order = {"o" => "player", "x" => "player"}
    else
        ai = choose_ai
        ai_2 = choose_ai
        order = {"o" => "ai_2", "x" => "ai"}
    end
    player_class.player = "x"
    until game == "done" do
        board = board.board
        player = player_class.player
        p "#{player}'s turn'"
        board.print
        if order[player_class.player] == "player"
            p "choose one"
            choice = gets.chomp
        elsif order[player_class.player] == "ai"
            choice = ai.move(board.board,player_class.player)
        else
            choice = ai_2.move(board.board,player_class.player)
        end

                if board.key_check?(choice) == true
                    if board.valid_spot?(choice) == true
                        board.update(player,choice)
                        if board.winner? == true
                            ret = "#{player} wins"
                            game = "done"
                        else
                            if board.board_not_full? == true
                                player_class.change_players
                            else
                                ret = "tie game"
                                game = "done"
                            end
                        end
                    else
                        p "invalid move"
                    end
                else
                    p "invalid move"
                end
            
    end
    board.print
    p ret
end
    game