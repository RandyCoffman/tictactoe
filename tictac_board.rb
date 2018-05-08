class Tictac_board

    attr_accessor :board, :size

    def initialize(size)
        @board = {}
        @size = size
        board_generator()
    end

    def board_generator()
        for board_size in 1..(@size*@size) do
                @board["#{board_size}"] = board_size
        end
    end

end