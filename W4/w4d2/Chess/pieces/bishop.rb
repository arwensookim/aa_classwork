require_relative 'slidable.rb'
require_relative '../piece.rb'

class Bishop < Piece
    include Slidable

    def symbol
        '♝'
    end

    private
    def move_dirs
        diagonal_dirs
    end

end