
class Person
  attr_reader :id
  attr_accessor :name, :affiliation
  @@people = []

  def initialize(name)
    set_id
    @name = name
    @@people << self
  end

  # Helper returns all people
  def self.people
    @@people
  end

  # These helpers return voters and politicians
  def self.voters
    @@people.select{ |person| person.is_a?(Voter) }
  end

  def self.politicians
    @@people.select { |person| person.is_a?(Politician) }
  end

  # Helper handles modifying of @@people list
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
