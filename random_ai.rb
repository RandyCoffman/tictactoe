require_relative "tictac_board.rb"

class Random_ai 
    
    def initialize(size,marker)
        @size = size
    end

    def choice(board_class,player)
        board = board_class.board
        choice = (1..(@size * @size)).to_a[rand(@size * @size - 1)].to_s
        board[choice].class == Integer ? choice : choice(board_class,player)
    end
end