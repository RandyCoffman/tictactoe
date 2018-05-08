class TicTac_player

attr_accessor :player, :player2

    def initialize
        @player = "x"
    end

    def change_icon()
       @player =  (@player == "x" ? "o" : "x")
    end

end