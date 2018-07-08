require_relative 'views/prompts'
require_relative 'config/routes'
require_relative 'seed'

Seed.seed

loop do 
  command = Prompts.main
  Routes.route command[:user_input]
end
