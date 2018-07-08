module Seed
  def self.seed
    Voter.new('Joe', 'l')
    Voter.new('John', 'c')
    Voter.new('Jane', 's')
    Voter.new('Bob', 't')
    Voter.new('Larry', 'n')
    Politician.new('Lester', 'd')
    Politician.new('Charlie', 'r')
  end
end