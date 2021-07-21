require_relative 'card.rb'
require 'byebug'

class Board
    CARDS = ['K', 'Q', 'J', 'A', '1', '9', '8', '7']

    def self.get_random
        a, b = rand(4), rand(4)
        [a, b]
    end

    def initialize
        @board = Array.new(4) { Array.new(4) }
        self.populate
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def populate
        CARDS.each do |card|
            2.times do
                random = Board.get_random
                while !self.empty?(random)
                    random = Board.get_random
                end
                self[random] = Card.new(card)
            end
        end
    end

    def render
        @board.each do |row|
            row.each do |ele|
                card = ele
                if card.revealed
                    print card.hidden_card + ' '
                else
                    print ('_') + ' '
                end
            end
            puts ' '
        end
    end

    def render_hidden
        @board.each do |row|
            row.each do |ele|
                print ele.hidden_card
            end
            puts " "
        end
    end

    def empty?(pos)
        self[pos] == nil
    end

    def won?
        @board.all? do |row|
            row.all? { |card| card.revealed == true }
        end
    end

    def reveal(guessed_pos)
        card = self[guessed_pos]
        if !card.revealed
            card.reveal
            card.hidden_card
        end
    end
end