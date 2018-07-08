require_relative '../models/election'
require_relative '../models/voter'
require_relative '../models/politician'
require_relative '../models/person'
require_relative '../views/election_prompts'

module Elections_Controller
  def self.create
    # User Choose Candidates
    cand_options = Person.politicians
    cands = Election_Prompts.create(cand_options)
    election = Election.new
    # Add Candidates to Election
    dem = Politician.find(cands[:dem])
    rep = Politician.find(cands[:rep])
    election.candidates += [dem, rep]
    # Add Voters to Election
    election.voters += Person.voters
  end

  def self.list
  end

  def self.update
  end

  def self.delete
  end

  def self.simulate
    elections = Election.elections
    elec_id = Election_Prompts.choose(elections)
    election = Election.find(elec_id)
    election.create_ballots
  end
end