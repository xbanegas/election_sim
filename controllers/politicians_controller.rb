require_relative '../models/politician'
require_relative '../models/person'
require_relative '../views/politician_prompts'

module Politicians_Controller
  def self.create
    data = Politician_Prompts.create
    name = data[:name]
    affiliation = data[:affiliation]
    politician = Politician.new(name, affiliation)
    Politician_Prompts.display(politician)
  end

  def self.list
    Politician_Prompts.list Person.politicians
  end

  def self.update
    pol = Politician_Prompts.update Person.politicians
    politician = Person.politicians.find do |politician| 
      politician.id == pol[:pol_id].to_i
    end
    case pol[:field]
    when "n"
      politician.name = pol[:value]
    when "a"
      politician.affiliation = pol[:value]
    end
    Politician_Prompts.display(politician)
  end

  def self.delete
    pol_id = Politician_Prompts.delete Person.politicians
    new_pol_list = Person.politicians.delete_if do |pol|
      pol.id == pol_id
    end
    Person.update_people "politician", new_pol_list
    list
  end
end