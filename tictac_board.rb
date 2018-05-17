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
# makes the board size whatever @size is to the power of 2, so if you enter 3 for size you will get a normal board.
        for board_size in 1..(@size**2) do
                @board["#{board_size}"] = board_size
        end
    end

    def win_generator() # Generates winning moves based on @size of the board. Includes row, diagonal, and column wins

# Makes each possible win by using rows
        for row in 1..@size do
            @win << ((((row - 1) * @size) + 1)..(@size * row)).to_a
        end

# Makes each possible win by using columns
        for col in 1..@size do 
            win_combo = []
            for number in 0..(@size - 1) do 
                win_combo.push((number * @size) + col)
            end
            @win << win_combo
        end

# Makes each possible win by using diagonals
        for dia in [[1,(@size + 1)],[@size,(@size - 1)]] do
            win_combo = []
            for number in 0..(@size - 1) do
                win_combo.push(dia[0] + (number * dia[1]))
            end
            @win << win_combo
        end
    end

    def board_full?() 
         board.values.any? { |positions| (1..(@size**2)).include?(positions) }
    end

    def valid_position?(choice)
        @board["#{choice}"] == choice && @board["#{choice}"] != "x" && @board["#{choice}"] != "o"
    end

    def winner_or_loser?() # decides if the array has a winning combo or notS
        loser = []
        @win.each do |win|
            winner = []
            for number in 0..(@size-2) do
                winner.push(@board["#{win[number]}"] == @board["#{win[number+1]}"])
            end
            loser << winner.include?(false)
        end
        loser.include?(false)
    end

    def valid_position_input?(choice)
        (1..(@size**2)).to_a.include?(choice.to_i)
    end

    def update_board_with_position(marker,position)
        @board["#{position}"] = marker if valid_position?(position) == true
    end

    def print_board()
        rows = @board.values.each_slice(@size).to_a
        rows.each do |row|
            string =""
            line = ""
            row.each do |item|
                line +=" - "

                string+="|#{item.to_s}|"
            end
            p line
            p string
            p line
        end
    end

end