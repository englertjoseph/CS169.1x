class RockPaperScissors
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    valid_strategy = /R|P|S/ =~ player1[1] && /R|P|S/ =~ player2[1]
    fail(NoSuchStrategyError 'Strategy must be one of R,P,S') unless valid_strategy

    return player1 if player1[1] == player2[1]  # Player 1 wins in the event of a draw
    case player1[1]
    when player2[1] then player1  # Player1 wins in the event of a draw.
    when 'R' then player2[1] == 'S' ? player1 : player2
    when 'P' then player2[1] == 'R' ? player1 : player2
    when 'S' then player2[1] == 'P' ? player1 : player2
    end
  end

  def self.tournament_winner(tournament)
  end
end
