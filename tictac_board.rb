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
            @win<<((((row - 1) * @size) + 1)..(@size * row)).to_a
        end

        # Makes each possible win by using columns
        for col in 1..@size do 
            arr = Array.new
            for number in 0..(@size-1) do 
                arr.push((number * @size) + col)
            end
            @win << arr
        end

        # Makes each possible win by using diagonals
        for dia in [[1,(@size+1)],[@size,(@size-1)]] do
            arr = Array.new
            for number in 0..(@size - 1) do
                arr.push(dia[0] + (number * dia[1]))
            end
            @win << arr
        end
    end

    def board_full?() 
         board.values.any? { |positions| (1..(@size*@size)).include?(positions) }
    end

    def valid_position?(choice)
        @board["#{choice}"] == choice && @board["#{choice}"] != "x" && @board["#{choice}"] != "o"
    end

 def winner_or_loser?()
        loser = Array.new
        @win.each do |win|
            winner = []
            for number in 0..(@size-2) do
                # p @board["#{win[num]}"]
                # p @board["#{win[num+1]}"]
                winner.push(@board["#{win[number]}"] == @board["#{win[number+1]}"])
                # p "#{arr} arr here"
            end
            loser << winner.include?(false)
            # p "#{not_a_winner} winner here"
        end
        loser.include?(false)
    end

    def valid_position_input?(choice)
        (1..(@size*@size)).to_a.include?(choice.to_i)
    end

    def update_board_with_position(marker,position)
        @board["#{position}"] = marker
    end

end