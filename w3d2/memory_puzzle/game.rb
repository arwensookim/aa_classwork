require_relative 'card.rb'
require_relative 'board.rb'

class Game
    def initialize
        @board = Board.new
    end

    def play
        game_over = false
        while !@board.won?
            cards = []
            2.times do 
                print "enter two numbers with space that represent position: "
                pos = gets.chomp.split(" ").map(&:to_i)
                while @board[pos].revealed
                    print "Oops! try again : "
                    pos = gets.chomp.split(" ").map(&:to_i)
                end
                @board.reveal(@board[pos])
                cards.push(@board[pos])
            end

        end
    end

end