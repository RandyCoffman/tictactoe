require_relative "tictac_board.rb"

class Sequential_ai
    
    def initialize(size,marker)
        @size = size
    end

    def choice(board_class,player)
        board = board_class.board
       	move = (1..@size**2).to_a
       	counter = 0
       	until board_class.valid_position?(move[counter].to_i) != false
       		counter += 1
       		move[counter].to_i
       	end
		move[counter].to_i
    end
end