require_relative 'card.rb'
require_relative 'board.rb'

class Game
    def initialize
        @board = Board.new
    end

    def play
        @board.render_hidden
        while !@board.won?
            cards = []
            2.times do 
                print "enter two numbers with space that represent position: "
                pos = gets.chomp.split(" ").map(&:to_i)
                while @board[pos].revealed
                    print "Oops! try again : "
                    pos = gets.chomp.split.map(&:to_i)
                end
                @board.reveal(pos)
                cards.push(@board[pos])
                @board.render
                puts ''
            end
            if cards[0] != cards[1]
                cards[0].hide
                cards[1].hide
            end
            cards = []
            @board.render
        end
        puts 'Game over! You won!!'
    end
end