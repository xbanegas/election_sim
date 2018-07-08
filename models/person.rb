
class Person
  attr_accessor :name, :affiliation
  attr_reader :id
  @@people = []
  def initialize(name)
    set_id
    @name = name
    @@people << self
  end
  def self.people
    @@people
  end
  def self.voters
    @@people.select{ |person| person.is_a?(Voter) }
  end
  def self.politicians
    @@people.select {|person| person.is_a?(Politician)}
  end
  def self.update_people(type, ppl_list)
    case type
    when "voter"
      @@people = politicians + ppl_list
    when "politician"
      @@people = voters + ppl_list
    end
  end 
	private
	def set_id
		@id = @@people.length + 1
	end
end
