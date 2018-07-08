require_relative '../models/voter'
require_relative '../models/person'
require_relative '../views/voter_prompts'

module Voters_Controller
  def self.create
    data = Voter_Prompts.create
    name = data[:name]
    affiliation = data[:affiliation]
    voter = Voter.new(name, affiliation)
    Voter_Prompts.display(voter)
  end

  def self.list
    Voter_Prompts.list Person.voters
  end

  def self.update
    voter_data = Voter_Prompts.update Person.voters
    voter = Person.voters.find do |voter|
      voter.id == voter_data[:voter_id]
    end
    case voter_data[:field]
    when "n"
      voter.name = voter_data[:value]
    when "a"
      voter.affiliation = voter_data[:value]
    end
    Voter_Prompts.display(voter)
  end

  def self.delete
    voter_id = Voter_Prompts.delete Person.voters
    new_voter_list = Person.voters.delete_if do |voter|
      voter.id == voter_id
    end
    Person.update_people "voter", new_voter_list
    list
  end
end