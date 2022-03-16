require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'
#any thing that prints in the expect part does not check anything. need to fix this

RSpec.describe Game do
    # basic turn
    # winner should be player 1 since card1 has a heigher rank than card 3
    describe 'basic turn' do
        # set up the decks and the turn for all basic tests
        before :each do
            #this will be deck 1
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2
            @card3 = Card.new(:heart, '9', 9)  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card3, @card4, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @game = Game.new(@player1,@player2)
            
        end

        it "exists and has readable attributies" do
        
            expect(@game).to be_an_instance_of(Game)
            expect(@game.player1).to eq(@player1)
            expect(@game.player2).to eq(@player2)
            expect(@game.turn).to eq(nil)
        end

        it "check start turn" do
            out = @game.start_turn(1)
            
            expect(out).to eq(puts "Turn 1: #{@player1.name} won two cards")
            expect(@player1.deck.cards).to eq ([@card2, @card5, @card8,@card1,@card3])
            expect(@player2.deck.cards).to eq ([@card4, @card6, @card7])
        end

        it "check start game" do #v1
            out = @game.start_game
            
            expect(out).to eq("Draw")
           
        end

    end 


    describe 'war turn' do
        # this tests all methods of game if the turn type is war.
        # in this example player 2 should be the winner since card 6 is a larger rank than card 5
        
        # set up the deck for all war turn tests
        before :each do
            #this will be deck 1 
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card3 = Card.new(:heart, '9', 9)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([ @card4,@card3, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @game = Game.new(@player1,@player2)
        end

        it "exists and has readable attributies" do
        
            expect(@game).to be_an_instance_of(Game)
            expect(@game.player1).to eq(@player1)
            expect(@game.player2).to eq(@player2)
            expect(@game.turn).to eq(nil)
        end

        it "check start turn" do
            out = @game.start_turn(1)
            
            expect(out).to eq(puts "Turn 1: #{@player2.name} won 6 cards")
            expect(@player1.deck.cards).to eq ([@card8])
            expect(@player2.deck.cards).to eq ([@card7, @card1, @card2, @card5,@card4,@card3, @card6])
        end

        it "check start game" do #v1
            out = @game.start_game
            
            expect(out).to eq("Player 2 won!")
           
        end

    end

    describe 'mutually assured distruction turn' do
        # this tests all methods of turn if the turn type is :mutually_assured_destruction.
        # in this example there is no winner since the 1st and 3rd cards in each deck are the same rank
        
        # set up the deck for all :mutually_assured_destruction turn tests
        before :each do
            #this will be deck 1 
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card3 = Card.new(:heart, '9', 9)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card4, @card3, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @game = Game.new(@player1,@player2)
        end

        
        it "exists and has readable attributies" do
        
            expect(@game).to be_an_instance_of(Game)
            expect(@game.player1).to eq(@player1)
            expect(@game.player2).to eq(@player2)
            expect(@game.turn).to eq(nil)
        end
        
        it "check start turn" do
            out = @game.start_turn(1)
            
            expect(out).to eq(puts "Turn 1: *mutually assured destruction* 6 cards removed from play")
            expect(@player1.deck.cards).to eq ([@card8])
            expect(@player2.deck.cards).to eq ([@card7])
        end
        it "check start game" do #v1
            out = @game.start_game
            #binding.pry
            expect(out).to eq( "Player 2 won!")
           
        end

    end

    



    
    
end