# This calss creates a player, it has readable attributes: name, deck, and lost.
# lost keeps track of if the player has lost the game

class Player
    attr_reader :name, :deck, :lost
    def initialize(name,deck)
        @name = name
        @deck = deck
        @lost = false
    end

    # If the player's deck becomes empty, they lose the game.
    def has_lost?
        if @deck.cards.empty?
            @lost = true
        end
        @lost
    end
end