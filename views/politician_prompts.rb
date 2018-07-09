require_relative 'prompts'

# Politician Prompts
class Politician_Prompts < Prompts
  AFILLS = {"d" => "Democrat", "r" => "Republican"}
  FIELDS = {"n" => "Name", "a"=>"Affiliation"}
  AFILL_PROMPT = "Enter affiliation: (D)emocrat or (R)epublican"

  def self.create
    puts "Enter Politician Name"
    name = gets.chomp
    puts AFILL_PROMPT
    affiliation = gets.chomp.downcase
    return {name: name, affiliation: affiliation}
  end

  def self.list(politicians)
    pol_list = politicians.map do |pol| 
      display_person pol
    end
  end

  def self.update(politicians)
    list politicians
    puts "Enter politician id to update: "
    pol_id = gets.chomp
    puts "Update (N)ame or (A)ffiliation?"
    field = gets.chomp.downcase
    if field == "a"
      puts AFILL_PROMPT
    else
      puts "Enter new #{FIELDS[field]}"
    end
    value = gets.chomp
    return {pol_id: pol_id, field: field, value: value}
  end

  def self.delete(politicians)
    list politicians
    puts "Enter politician id to delete: "
    pol_id = gets.chomp.to_i
  end

end