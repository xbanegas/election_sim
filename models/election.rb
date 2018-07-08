require_relative 'ballot'

class Election
  attr_reader :id
  attr_accessor :candidates, :voters, :ballots
  @@elections = []
  def initialize
    set_id
    # array of politician ids
    @candidates = []
    @voters = []
    # array of ballots
    @ballots = []
    @vote_count = nil
    @winner = nil
    @@elections << self
  end

  def self.elections
    @@elections
  end

  def create_ballots
    @voters.each do |voter|
      candidate = candidates.sample
      @ballots << Ballot.new(self, voter, candidate) 
    end
    self.tally
  end

  def tally
    vote_count = @candidates.map{|candidate| [candidate, 0]}
    @ballots.each do |ballot|
      cand_count = vote_count.find{|count| count[0].id == ballot.candidate.id}
      cand_count[1] +=1
    end
    @vote_count = vote_count
    winner_index = @vote_count.index do |voteCount|
      voteCount[1] == vote_count.map{|votes| votes[1]}.max
    end
    @winner = @vote_count[winner_index][0]
    puts @vote_count
    puts @winner.name
  end

  def self.find(id)
    Election.elections.find do |elec|
      elec.id == id
    end
  end

  private
  def set_id
    @id = @@elections.length + 1
  end
end