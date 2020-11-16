require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    possible_move = self.children
    possible_move.each do |node| 
      # winner_move(node)
      if node.board.winner != switch(evaluator)
        return false
      end
    end
    return true 
  end

  # def winner_move(node)
  #   (0..2).each do |row|
  #     (0..2).each do |col|
  #       board = node.board.dup
  #       pos = [row, col]

  #       next unless board.empty?(pos)
  #       board[pos] = node.next_mover_mark

  #       return pos if board.winner == node.next_mover_mark
  #     end
  #   end
  #   nil
  #   # no w
  # end

  # [:o, nil, :o], 
  # [nil, nil, nil]  next_mover_mark :o
  # [nil, :x, :o]

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    current_pos = @prev_move_pos
    empty_pos = []
    next_mark = switch(next_mover_mark)
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        new_board = @board.dup
        if new_board.rows[i][j].nil?
          new_board.rows[i][j] = next_mover_mark
          empty_pos << TicTacToeNode.new(new_board, next_mark , [i, j])
        
        end
      end
    end
    empty_pos
  end

  def switch(mark)
    if mark == :x
      mark = :o
    else
      mark = :x
    end
  end

  
end
