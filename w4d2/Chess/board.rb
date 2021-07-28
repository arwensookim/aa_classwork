require_relative

class Board
    def initialize
        @null_piece = NullPiece.instance
        @chessboard = Array.new(8) {Array.new(8, @null_piece)}
    end

    def[](pos)
        rank, file = pos
        @chessboard[row][col]
    end

    def []=(pos, piece)
        rank, file = pos
        @chessboard[row][col] = piece
    end

    def valid_pos?(pos)
        rank, file = pos
        rank.between?(0,7) && file.between?(0,7)
    end

    def empty?(pos)
        self[pos].empty?
    end

    def add_piece(piece, pos)
        raise 'it is not an empty position' unless self[pos].empty?
        self[pos] = piece
    end

    def move_piece(color, start_pos, end_pos)
        piece = self[start_pos]

        if piece.color
    end

end