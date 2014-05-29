class RockPaperScissors
  ##@@ex = RockPaperScissors::NoSuchStrategyError.new("Strategy must be one of R,P,S")
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError
  end
  def self.winner(player1, player2)
    p1 = "RSP".index(player1[1])
    p2 = "RSP".index(player2[1])
    if p1==nil or p2 == nil
     raise RockPaperScissors::NoSuchStrategyError.new("Strategy must be one of R,P,S")
    elsif (player1[1] == player2[1])
      player1
    elsif ((p1-p2==-1)|(p1-p2==2))
      player1
    else
      player2
    end
  end
  def self.tournament_winner(tournament)
    if ((tournament[0][1].class==String) & (tournament[1][1].class==String))
      self.winner(tournament[0], tournament[1])
    else
      self.winner(self.tournament_winner(tournament[0]),self.tournament_winner(tournament[1]))
    end
  end
end
