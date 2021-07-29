require_relative "../piece.rb"

class Pawn < Piece
    def symbol
        '♟'
    end

    def moves

    end

    private
    def at_start_row?
    end

    def forward_dir
        [1,1]
    end

    def forward_steps
        
    end

    def side_attacks
    end
end