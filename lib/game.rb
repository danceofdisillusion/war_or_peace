# this class runs the game. It has readable attributes, player1, player2 and turn
class Game
    attr_reader :player1, :player2, :turn
    def initialize (player1,player2)
        @player1 = player1
        @player2 = player2
        @turn = nil
    end

     def start_game
        # keep track of the current turn
        turn_counter = 1
        #turns will continue to be created and run until one of the players has lost or we reach the
        # a maximum number of turns
        until @player1.has_lost? == true || @player2.has_lost? == true || turn_counter >100000
            self.start_turn(turn_counter)
            turn_counter +=1
        end


    # this will print the winner of the game or Draw if there was no winner.
        if @player1.has_lost? == true
            puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
            "Player 2 won!"
        elsif @player2.has_lost? == true
            puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
            "Player 1 won!"
        elsif @player1.has_lost? == false && @player2.has_lost? == false
            puts "--- DRAW ---"
            "Draw"
        end
     end



     # this method starts a single turn of the game

    def start_turn(turn_counter)
        #create a new turn object
        @turn = Turn.new(@player1,@player2)
        #determine the winner of the turn. This method calls turn.type to determine the winner
        winner = @turn.winner
        # This will save the turn type to help us know what to print to the user
        type_of_turn = @turn.turn_type
        # Once pile_cards method has been called, we CANNOT call the winner method or the turn_type method.
        # this is because pile_cards changes the deck. So those methods would now give different results.
        # pile cards removes the cards from the player's decks and adds them to an arry that will be awwarded to the winner of the turn
        @turn.pile_cards
        # add the won cards to the winner of the turn
        @turn.award_spoils(winner)

        #prints the winner of the turn and how many cards they won.
        if type_of_turn == :basic
            puts "Turn #{turn_counter}: #{winner.name} won two cards"
        elsif type_of_turn == :war
            puts "Turn #{turn_counter}: WAR #{winner.name} won #{@turn.spoils_of_war.length} cards"
        elsif type_of_turn == :mutually_assured_destruction
            puts "Turn #{turn_counter}: *mutually assured destruction* #{@turn.spoils_of_war.length} cards removed from play"
        end


    end
end