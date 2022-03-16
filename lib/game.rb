class Game
    attr_reader :player1, :player2, :turn
    def initialize (player1,player2)
        @player1 = player1
        @player2 = player2
        turn = nil
    end
     def start_game
        turn_counter = 1

        #  self.start_turn(turn_counter) #temporary


        until @player1.has_lost? == true || @player2.has_lost? == true || turn_counter >10000
            self.start_turn(turn_counter)
            turn_counter +=1
        end
    
        if @player1.has_lost? == true
            puts "Player 2 won!"
            "Player 2 won!"
        elsif @player2.has_lost? == true
            puts "Player 1 won!"
            "Player 1 won!"
    
        elsif @player1.has_lost? == false || @player2.has_lost? == false
            puts "DRAW"
            "Draw"
        end
        


     end

    def start_turn(turn_counter)
        @turn = Turn.new(@player1,@player2)
        winner = turn.winner
        type_of_turn = turn.turn_type
        @turn.pile_cards
        @turn.award_spoils(winner)
        #binding.pry
        if type_of_turn == :basic
            puts "Turn #{turn_counter}: #{winner.name} won two cards"
        elsif type_of_turn == :war
            puts "Turn #{turn_counter}: WAR #{winner.name} won #{turn.spoils_of_war.length} cards"
        elsif type_of_turn == :mutually_assured_destruction
            puts "Turn #{turn_counter}: *mutually assured destruction* #{turn.spoils_of_war.length} cards removed from play"
        end


    end
end