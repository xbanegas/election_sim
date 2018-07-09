
# Prompts Module
# These functions accept options for displaying a prompt to user.
# They prints the prompt(s), take input from the user, and return
# these responses to the controller that initially called them.

class Prompts
  MODEL_OPTIONS = ["p", "v", "e"]
  MODEL_OPTIONS_TEXT = "(P)olitician (V)oter (E)lection"
  AFFILS = {
    "l" => "Liberal", "c" => "Conservative",
    "t" => "Tea Party", "s" => "Socialist",
    "n" => "Neutral",
    "d" => "Democrat", "r" => "Republican"
  }

  # Main prompt
  def self.main
    type, options = "do", ["c", "l", "u", "d", "s"]
    options_text = "(C)reate, (L)ist, (U)pdate, (D)elete (S)imulate"
    prompt(type, options, options_text)
  end

  # Create prompt
  def self.create
    type, options = "create", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT 
    res = prompt(type, options, options_text)
  end

  # List prompt
  def self.list
    type, options = "list", MODEL_OPTIONS
    options_text = "(P)oliticians (V)oters (E)lections"
    prompt(type, options, options_text)
  end

  # Update prompt
  def self.update
    type, options = "update", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT
    user_option = prompt(type, options, options_text)
  end

  # Delete prompt
  def self.delete
    type, options = "delete", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT
    user_option = prompt(type, options, options_text)
  end

  # Display Person
  def self.display_person(person)
    puts "##{person.id} #{person.name}: #{AFFILS[person.affiliation]}"
  end

  # generic prompt loop
  private
  def self.prompt(type, options, options_text)
    user_input = ""
    until options.include? user_input
      puts "What would you like to #{type}?"
      puts options_text
      user_input = gets.chomp.downcase
    end
    return {user_input: user_input, type: type}
  end
end  