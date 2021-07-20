require_relative 'card.rb'

class Board
    CARDS = ['K', 'Q', 'J', 'A', '10', '9', '8', '7']

    def self.get_random
        a, b = rand(4), rand(4)
        [a, b]
    end

    def initialize
        @board = Array.new(4) { Array.new(4) }
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
            puts row.join(' ')
        end
    end

    def empty?(pos)
        self[pos] == nil
    end
end