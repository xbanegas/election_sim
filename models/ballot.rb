class Ballot
  attr_reader :voter, :candidate
  def initialize(election, voter, candidate)
    @election = election
    @voter = voter
    @candidate = candidate
  end
end