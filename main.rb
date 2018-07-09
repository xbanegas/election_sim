require_relative 'views/prompts'
require_relative 'config/routes'
require_relative 'seed'

# Set the inital state to have some data
Seed.seed

# Main Loop
# Accepts to top level menu input and sends response to router
loop do 
  command = Prompts.main
  Routes.route command[:user_input]
end
