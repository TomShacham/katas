class User

  attr_accessor :index, :rank, :progress

  RANKS = (-8..8).to_a - [0]

  def initialize
    self.index = 0
    self.rank = RANKS[@index]
    self.progress = 0
  end

  def progress
    @progress = 0 if @rank == 8
    @progress = @progress % 100
  end

  def rank
    @rank = 8 if @rank > 8
    @rank
  end

  def inc_progress difficulty
    raise if difficulty < -8 || difficulty > 8 || difficulty == 0
    actual_difficulty = RANKS.index(difficulty)
    actual_rank = RANKS.index(@rank)
    difference = actual_difficulty - actual_rank
    increase = 10 * difference**2
    increase = 3 if difference == 0
    increase = 1 if difference == -1
    increase = 0 if difference < -1
    @index += (@progress + increase) / 100
    @rank = RANKS[@index]
    @progress += increase; self.progress
  end

end


#best answer on codewars

class User
  def initialize
    @progress_max = 1500
    @progress = 0
    @ranks = [-8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8]
  end

  def rank
    @ranks[@progress / 100]
  end

  def progress
    @progress % 100
  end

  def inc_progress(kata_rank)
    raise ArgumentError unless @ranks.include? kata_rank
    d = (kata_rank > 0 ? kata_rank-1 : kata_rank) - (rank > 0 ? rank-1 : rank)
    @progress += d < -1 ? 0 : d == -1 ? 1 : d == 0 ? 3 : 10*d*d
    @progress = @progress_max if @progress > @progress_max
  end
end
























