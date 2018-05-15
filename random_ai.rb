require_relative "tictac_board.rb"

class Random_ai 
    
    def initialize(size,marker)
        @size = size
    end

    def choice(board_class,player)
        board = board_class.board
       	move = rand(1..@size*@size)
       	if board_class.valid_position?(move) == false
       		choice(board_class,player)
       	else
       		move
       	end

    end
end