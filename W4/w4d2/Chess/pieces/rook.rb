require_relative '../piece.rb'
require_relative 'slidable.rb'

class Rook < Piece
    include Slidable

    def symbol
        '♜'
    end

    private
    def move_dirs
        horizontal_dirs
    end

end