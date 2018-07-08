require_relative 'person'

class Voter < Person
  @@affiliations = ['l', 'c', 't', 's', 'n']
  def initialize(name, affiliation)
    super(name)
    if @@affiliations.include? affiliation
      @affiliation = affiliation
    else
      puts "invalid affiliation"
    end
  end
end

