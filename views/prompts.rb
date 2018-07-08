# Prompts Module

module Prompts
  MODEL_OPTIONS = ["p", "v", "e"]
  MODEL_OPTIONS_TEXT = "(P)olitician (V)oter (E)lection"

  # main prompt
  def self.main
    type, options = "do", ["c", "l", "u", "d", "s"]
    options_text = "(C)reate, (L)ist, (U)pdate, (D)elete (S)imulate"
    prompt(type, options, options_text)
  end

  # create prompt
  def self.create
    type, options = "create", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT 
    res = prompt(type, options, options_text)
     
  end

  # list prompt
  def self.list
    type, options = "list", MODEL_OPTIONS
    options_text = "(P)oliticians (V)oters (E)lections"
    prompt(type, options, options_text)
  end

  # update prompt
  def self.update
    type, options = "update", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT
    user_option = prompt(type, options, options_text)
  end

  # delete prompt
  def self.delete
    type, options = "delete", MODEL_OPTIONS
    options_text = MODEL_OPTIONS_TEXT
    user_option = prompt(type, options, options_text)
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