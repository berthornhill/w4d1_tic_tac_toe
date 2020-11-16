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
    current_pos = @prev_move_pos
    empty_pos = []
    next_mark = self.switch(next_mover_mark)
    @oard.rows.each do |row|
      row.each do |col|
        new_board = @board.dup
        if new_board.rows[row][col].nil?
          
          new_board.rows[row][col] = next_mover_mark
          empty_pos << TicTacToeNode.new(new_board, next_mark , [row, col])
        end
      end
      empty_pos
    end
  end

  def switch(mark)
    if mark == :x
      mark = :o
    else
      mark = :x
    end
  end

  
end
