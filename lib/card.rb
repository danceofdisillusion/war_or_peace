# The card class creates a card. It has attributes, suit,
# value, and rank.

class Card
    attr_reader :suit, :value, :rank 
    def initialize (suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end
end