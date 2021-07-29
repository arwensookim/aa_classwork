require_relative 'stepable.rb'
require_relative '../piece.rb'

class Knight < Piece
    def symbol
        '♞'
    end
    
    protected
    def move_diffs
       [
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1]
        ]
    end
end
