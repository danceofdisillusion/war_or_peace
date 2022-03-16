def Game
    attr_reader :player1, :player2, :turn
    def initialize (player1,player2)
        @player1 = player1
        @player2 = player2
        turn = nil
    end
    def start_game
        turn_counter = 1
        until @player1.has_lost == true || @player2.has_lost == true || turn_counter >100
            self.start_turn
        end


    end

    def start_turn
        turn = Turn.new(@playerq,@player2)
        winner = turn.winner
        if winner = "No Winner"
        end

    end
end