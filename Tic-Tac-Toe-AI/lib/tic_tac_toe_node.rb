require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark
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
    current_pos = prev_move_pos
    empty_pos = []
    @board.each do |row|
      row.each do |col|
        if @board[row][col].length == 0
          empty << [row, col]
        end
      end
    end
  end

  def child_node_maker(pos)
    TicTacToeNode.new(board.place_mark(pos, next_mover_mark), )

  end

end
