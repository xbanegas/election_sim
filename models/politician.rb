require_relative 'person'

class Politician < Person
  @@affiliations = ['d', 'r']

  def initialize(name, affiliation)
    super(name)
    if @@affiliations.include? affiliation
      @affiliation = affiliation
    else
      puts "invalid affiliation"
    end
  end

  def self.find(id)
    Person.politicians.find do |pol|
      pol.id == id
    end
  end

  def self.get_party(party, pol_list=Person.politicians)
    pol_list.select { |pol| pol.affiliation == party }
  end
end