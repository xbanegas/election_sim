require_relative 'politician_prompts'

# Election Prompts

module Election_Prompts
  def self.create(candidates)
    puts "Creating Election"
    Politician_Prompts.list(candidates)
    puts "Enter id of Democratic Candidate:"
    dem = gets.chomp.to_i
    puts "Enter id of Republican Candidate:"
    rep = gets.chomp.to_i
    return {dem:dem, rep:rep}
  end

  def self.list(elections)
    elec_list = elections.map do |elec|
      puts "Election: #{elec.id}"
    end
  end

  def self.choose(elections)
    list elections
    puts "Enter id of Election to Simulate: "
    elec_id = gets.chomp.to_i
  end

  def self.display(elec)
    puts "Election: #{elec.id}"
  end
end