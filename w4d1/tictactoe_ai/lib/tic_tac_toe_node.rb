require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_pos = []
    (0..2).each do |row|
      (0..2).each do |col|
        if @board.empty?([row, col])
          
          new_board = @board.dup
          pos = [row, col]
          new_board[pos] = self.next_mover_mark
          new_mark = self.next_mover_mark == :x ? :o : :x
          
          empty_pos << TicTacToeNode.new(new_board, new_mark, pos)
        end
      end
    end
    empty_pos
  end

end

# x . .
# . . .
# . . .

# . x .
# . . .
# . . .

# . . x
# . . .
# . . .