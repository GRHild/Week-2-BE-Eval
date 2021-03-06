module Tennis
  class Game
    attr_accessor :player1, :player2, :winner

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
      @winner = winner
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    # wins_ball method determines who wins the ball and increments their score by 1
    def wins_ball(winner)
      if winner == 1
        @player1.record_won_ball!
      else
        @player2.record_won_ball!
      end
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    # Returns the String for all values 0-4 points and wins.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'deuce' if @points >= 3 && @points == @opponent.points
      return 'forty' if @points == 3
      return 'advantage' if @points > 3 && @points == @opponent.points + 1
      return 'win' if @points >= 3 && @points == @opponent.points + 2
    end
  end
end








