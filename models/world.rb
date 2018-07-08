require_relative 'person'
require_relative 'election'

class World
  def initialize
    @people = Person.people
    @elections = Election.elections 
  end
  def new_election(day)
    Election.new(day)
  end
  def existing_people_ids
    @people.map{|person| person.id}
  end
  def existing_election_ids
    @election.map{|election| election.id}
  end
end