require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

# welcome
# c = get_character_from_user
# show_character_movies(c)

# puts "hello world"
# def greet 
#     puts 'welcome to the whole happy life, the best resource for Self-Care Archives!'
# end 
cli = CommandLineInterface.new
#cli.greet 
cli.get_solution_from_health