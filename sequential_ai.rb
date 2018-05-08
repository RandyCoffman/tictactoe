require_relative "tictac_board.rb"

class Sequential_ai 
    
    def initialize(size,marker)
        @size = size
        @num = 0
    end

    def choice(board_class,player)#sequence ai makes a move in a certain sequence
        board = board_class.board
        move_choice = (1..(@size * @size)).to_a.shuffle(random: Random.new(@size))[@num]
        @num += 1
        board[move_choice.to_s].class == Integer ? move_choice.to_i : choice(board_class,player)
    end
   
end