class Board
    CARDS = ['K', 'Q', 'J', 'A', '10', '9', '8', '7']

    def self.get_random
        a, b = rand(3), rand(3)
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
                random = @board.get_random
                while !self.empty?(random)
                    random = @board.get_random
                end
                self[random] = card
            end
        end
    end

    

    def empty?(pos)
        @board[pos] == nil
    end
end