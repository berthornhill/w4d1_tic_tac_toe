require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    cpu = TicTacToeNode.new(game.board, mark)
    if cpu.winning_node?(mark)
      possible_move = cpu.children
      possible_move.each do |node|
      end
    elsif cpu.losing_node?(mark)

    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
