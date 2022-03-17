class Turn
    attr_reader :player1, :player2, :spoils_of_war, :turn_type
    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @turn_type = nil #this will be nil until the winner method is called
        
    end

    # type: a turn is :basic, :war, or :mutually_assured_destruction.
    # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
    # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
    # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    def type
        # if the first cards in the players deck have different ranks return basic
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            return :basic
        # if the rank of the first card is the same, we check the rank of the third card.
        # if the ranks of the third cards are the same, the turn is mutually_assured_destruction
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
                return :mutually_assured_destruction
            # We will get here if the ranks of the first cards are the same but the ranks of the second cards are
            # third cards are different. This is WAR
            else
                return :war
            end
                
        end
    end

# winner: this method will determine the winner of the turn.
# if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.
    def winner
       @turn_type = self.type
       #based on the turn type we determine the winner. 
    
        if @turn_type == :basic 
            #if the turn is basic, we determine the winner by the rank of the card at index 0
            return @player1 if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            return @player2 if @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        elsif @turn_type == :war 
            # if the turn type is war, we use the rank of the third cards to determin the winner
            return @player1 if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            return @player2 if @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        elsif @turn_type == :mutually_assured_destruction
        #if the turn type is mutually_assured_destruction, there is no winner
            "No Winner"    
        end
        
    end


# pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
# for a :basic turn, each player will send one card (the top card) to the spoils pile
# for a :war turn, each player will send three cards (the top three cards) to the spoils pile
# for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
# this method deltes the cards from the players decks, so type and winner cannot be called after this method

    def pile_cards
    
        #if the turn type is basic, both players move the first card of their decks to the spoils
        if @turn_type == :basic
            #add cars to spoils
            @spoils_of_war << @player1.deck.cards[0]
            @spoils_of_war << @player2.deck.cards[0]
            #remove cards from their original decks
            @player1.deck.remove_card
            @player2.deck.remove_card
        #if the turn type is war, both players move the first 3 cards to the spoils
        elsif @turn_type == :war
            #add cards to spoils
            @spoils_of_war.concat(@player1.deck.cards[0..2])
            @spoils_of_war.concat(@player2.deck.cards[0..2])
            # remove the first 3 cards from the original decks
            3.times do @player1.deck.remove_card
            end
            3.times do @player2.deck.remove_card
            end
        #otherwise the type is mutually assured distruction and the first three cards of 
        # both decks are removed from the game         
        else
            #remove the first 3 cards from both decks. These are not added back to any deck
            3.times do @player1.deck.remove_card
            end
            3.times do @player2.deck.remove_card
            end

        end

    end

    # award_spoils: this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
    # this method will take the argument of the winner and award the spoils to the winner of the turn


     def award_spoils(winner)
        
        if winner == @player1 || winner == @player2
            
            winner.deck.cards.concat(spoils_of_war)
        else
            
            "No Spoils Awarded"
         end

    end
end