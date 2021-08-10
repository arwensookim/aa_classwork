module Slideable
    HORIZONTAL_DIRS = [
        [-1, 0],    #left
        [1, 0],     #right
        [0, 1],     #up(vertical)
        [0, -1],    #down(vertical)
    ].freeze
    
    DIAGONAL_DIRS = [
        [:-1, -1],  #down + left
        [-1, 1],    #down + right
        [1, 1],     #up + right
        [1, -1],    #up + left
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = [] 

        move_dirs.each do |dx, dy|
            moves += grow_unblocked_moves_in_dir(dx, dy)
        end

    end


    private
    def move_dirs
        
        raise NotImplentedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        
        # in a loop:
        while true
            curr_x, curr_y = curr_x + dx, curr_y + dy
            new_pos = curr_x, curry_y

            break if !valid_pos?(new_pos)

            moves << new_pos if board.empty?(new_pos)
            # piece can move to new_pos if the piece in the position is opposit color
            if board[new_pos].color != piece.color 
                moves << new_pos 
            elsif board[new_pos].color == piece.color
                break
            end
        end
        # return moves
        moves
    end
end

