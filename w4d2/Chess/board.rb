require_relative 'pieces/bishop.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/null_piece.rb'
require_relative 'slidable.rb'
require_relative 'stepable.rb'



class Board
    def initialize
        @null_piece = NullPiece.instance
        @chessboard = Array.new(8) {Array.new(8, @null_piece)}
    end

    def[](pos)
        rank, file = pos
        @chessboard[rank][file]
    end

    def []=(pos, piece)
        rank, file = pos
        @chessboard[rank][file] = piece
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

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        self[end_pos] = piece if valid_pos?(end_pos)
        self[start_pos] = @null_piece
    end

end