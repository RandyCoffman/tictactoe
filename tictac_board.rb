class Tictac_board

    attr_accessor :board, :size, :win

    def initialize(size)
        @board = {}
        @size = size
        @win = []
        board_generator()
        win_generator()
    end

    def board_generator()
        for board_size in 1..(@size*@size) do
                @board["#{board_size}"] = board_size
        end
    end

    def win_generator() # Method that generates winning moves based on @size of the board

        # Makes each possible win by using rows
        for row in 1..@size do
            @win<<((((row-1)*@size)+1)..(@size*row)).to_a
        end

        # Makes each possible win by using columns
        for col in 1..@size do 
            arr = Array.new
            for num in 0..(@size-1) do 
                arr.push((num*@size)+col)
            end
            @win<<arr
        end

        # Makes each possible win by using diagonals
        for dia in [[1,(@size+1)],[@size,(@size-1)]] do
            arr = Array.new
            for num in 0..(@size-1) do
                arr.push(dia[0]+(num*dia[1]))
            end
            @win<<arr
        end
    end
end