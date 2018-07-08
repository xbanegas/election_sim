require_relative '../controllers/elections_controller'
require_relative '../controllers/politicians_controller'
require_relative '../controllers/voters_controller'

module Routes
  def self.route(command)
    case command
    when "c"
      puts "creating"
      create_options = Prompts.create
      route_model create_options
    when "l"
      puts "listing"
      list_options = Prompts.list
      route_model list_options
    when "u"
      puts "updating"
      update_options = Prompts.update
      route_model update_options
    when "d"
      puts "deleting"
      delete_options = Prompts.delete
      route_model delete_options
    when "s"
      puts "simulating"
      Elections_Controller.simulate
    end
  end

  def self.route_model(command)
    type = command[:type][0]
    case command[:user_input]
    when "p"
      case type
      when "c"
        Politicians_Controller.create
      when "l"
        Politicians_Controller.list
      when "u"
        Politicians_Controller.update
      when "d"
        Politicians_Controller.delete
      end
    when "v"
      case type
      when "c"
        Voters_Controller.create
      when "l"
        Voters_Controller.list
      when "u"
        Voters_Controller.update
      when "d"
        Voters_Controller.delete
      end
    when "e"
      case type
      when "c"
        Elections_Controller.create
      when "l"
        Elections_Controller.list
      when "u"
        Elections_Controller.update
      when "d"
        Elections_Controller.delete
      end
    end
  end
end