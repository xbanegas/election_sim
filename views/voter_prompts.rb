module Voter_Prompts
  AFFILS = {
    "l" => "Liberal", "c" => "Conservative",
    "t" => "Tea Party", "s" => "Socialist",
    "n" => "Neutral"
  }
  FIELDS = {"n" => "Name", "a"=>"Affiliation"}
  affil_list = AFFILS.values.map{|afill| "(#{afill[0].downcase})#{afill.slice(1, -1)}"}.join(", ")
  AFFIL_PROMPT = "Enter Affiliation: " + affil_list
  
  def self.create
    puts "Enter Voter Name"
    name = gets.chomp
    puts AFFIL_PROMPT
    affiliation = gets.chomp.downcase
    return {name: name, affiliation: affiliation}
  end

  def self.list(voters)
    voter_list = voters.map{ |voter| display voter }
  end

  def self.update(voters)
    list voters
    puts "Enter Voter id to update: "
    voter_id = gets.chomp.to_i
    puts "Update (N)ame or (A)ffiliation?"
    field = gets.chomp.downcase
    if field == "a"
      puts AFFIL_PROMPT
    else 
      puts "Enter new #{FIELDS[field]}"
    end
    value = gets.chomp
    return {voter_id:voter_id, field:field, value:value}
  end

  def self.delete(voters)
    list voters
    puts "Enter Voter id to delete: "
    voter_id = gets.chomp.to_i
  end

  def self.display(voter)
    puts "##{voter.id} #{voter.name}: #{AFFILS[voter.affiliation]}"
  end
end