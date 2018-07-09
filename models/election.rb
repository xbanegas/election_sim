require_relative '../models/person'
require_relative '../models/politician'
require_relative 'ballot'

class Election
  attr_reader :id, :vote_count, :winner
  attr_accessor :candidates, :voters, :ballots
  @@elections = []

  def initialize(cands)
    # Set default values
    set_id
    # array of politician ids
    @candidates = []
    @voters = []
    # array of ballots
    @ballots = []
    @vote_count = nil
    @winner = nil
    @@elections << self

    # Initialize voters and candidates with users choices
    dem = Politician.find(cands[:dem])
    rep = Politician.find(cands[:rep])
    @candidates += [dem, rep]
    @voters += Person.voters
  end

  # Reader for elections
  def self.elections
    @@elections
  end

  # Creates the ballots, votes
  def create_ballots
    @voters.each do |voter|
      @ballots << Ballot.new(self, voter)
    end
    self.tally
  end

  # Tallys ballots and sets vote_count and winner
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
  end

  # Helper selects election with id
  def self.find(id)
    Election.elections.find do |elec|
      elec.id == id
    end
  end

  def get_rep(party)
    Politician.get_party(party, @candidates)[0]
  end

  # Sets an id to every new election
  private
  def set_id
    @id = @@elections.length + 1
  end
end