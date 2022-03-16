require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'
#-------------------------------------------------------------------
# create the deck of cards
suits = [:heart, :spade, :club, :diamond]
values = ["2","3","4","5","6","7","8","9","10","Jack","Queen","King","Ace"]
cards = []

suits.each do |suit|
    (2..14).each do |i|
    cards << Card.new(suit, values[i-2],i)
    end
end
cards1 = cards.sample(26) 
cards2 = []
cards2.concat(cards-cards1)
#create the array of cards
#-------------------------------------------------------------------

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

p "Please input player 1 name"
player1 = Player.new(gets.chomp,deck1)
p "Please input player 2 name"
player2 = Player.new(gets.chomp,deck2)

puts "Welcome to War! (or Peace). This game will be played with #{cards.length} cards. \n" +
    "The players today are #{player1.name} and #{player2.name}. \n" +
    "Type 'GO' to start the game. \n" +
    "--------------------------------------------------------------------------------------"

my_game = Game.new(player1,player2)











