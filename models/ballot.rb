
class Ballot
  VOTE_WEIGHTS = {
    :d => 0.90, :r => 0.10,
    :l => 0.70, :c => 0.30,
    :s => 0.90, :t => 0.10,
    :n => 0.0
  }
  VOTE_KEY = {
    0 => "d",
    1 => "r"
  }

  attr_reader :voter, :candidate
  def initialize(election, voter)
    @election = election
    @voter = voter
    @candidate = nil
    vote
  end

  private
  def vote
    # candidates vote for themselves
    if not @election.candidates.select{|cand| @voter == cand}.empty?
      return @voter.affiliation
    end
    # vote according to weight
    affil = @voter.affiliation.to_sym
    vote = rand(100)
    vote = (vote * (1 + VOTE_WEIGHTS[affil])).round
    vote = 100 if vote > 100
    vote = if (vote <= 50) then 0 else 1 end
    party = VOTE_KEY[vote]
    @candidate = @election.get_rep(party)
  end
end