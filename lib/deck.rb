# The deck class creates a deck. 
# It takes an array of cards.


class Deck
    attr_reader :cards
    def initialize (cards)
        @cards = cards
        @high_ranking_cards = []
    end

    # Find the rank of the card at an index in the card array 
    def rank_of_card_at(index)
        if @cards[index] == nil
            0
        else
            @cards[index].rank
        end
    end
    # returns an array of the high ranking cards from the deck
    def high_ranking_cards
        @cards.select{ |card| card.rank > 10}
    end
    # calculate the percent of the deck that is high ranking cards
    def percent_high_ranking
        (self.high_ranking_cards.length/@cards.length.to_f*100).round(2)
    end
    
    # remove cards from the deck
    def remove_card
        @cards.delete_at(0)
    end
    
    # add cards to the deck
    def add_card(card)
        @cards.push(card)
    end
end

