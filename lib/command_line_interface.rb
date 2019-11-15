# def welcome
#     # puts out a welcome message h
#     puts "Hi world"
#   end
require_relative "user"
require_relative "health"
require_relative "solution"

class CommandLineInterface
    
   def greet 
        puts 'welcome to the whole happy life, the best resource for Self-Care Archives!'
    end 

    def menu
        puts 'what number you want to choose'
        puts '1. sign up'
        puts '2. sign in'
        puts '3. ceate health'
        puts '4. look up health'
        puts '5. search for your health problem'
        puts '6. get solution for your health problem'
        puts '7. write solution for your health problem'
        puts '8. delete user'
        puts '9. update user'
        inputs = STDIN.gets.chomp
        case inputs
        when "1"
            sign_up
        when "2"
            sign_in
        when "3"
            create_user_health
        when "4"
            look_up_health
        when "5"
            get_health_by_user
        when "6"
            get_solution_from_health
        when "7"
            write_a_solution
        when "8"
            delete_user
        when "9"
            update_user 
        else
            "Back to menu"
            menu
        end 
    end 
        

    def sign_up #1
        # sound = Music.new("file_name_for_music.wav")
        # sound.play
        puts "sign up "
        puts "for your security, we don't want to share your personal information to others "
        puts "enter your age"
        sign_up_age = STDIN.gets.chomp
        puts "enter your name"
        sign_up_name = STDIN.gets.chomp
        puts "enter your background"
        sign_up_background = STDIN.gets.chomp
        @signed = User.create(age: sign_up_age, name: sign_up_name, background: sign_up_background)
        ask_user_health()
        
    end 

    def sign_in#2
        puts "welcome back, enter your name"
        sign_in_name = STDIN.gets.chomp
        @signed = User.find_by(name: sign_in_name)
        if @signed == nil
            puts "couldn't find user. going back to menu"
            menu
        end
        puts "press 1 if you want to create a health_problem, press 2 and enter the health if you want to look up health problem, press 3 back to the menu"
        number = STDIN.gets.chomp

        if number == "1"
            create_user_health()
        elsif number == "2"
            # puts "what's the name of the health you are looking on"
            # name_looking_on = STDIN.gets.chomp
            look_up_health()
        elsif number == "3"
            menu
        end 
        
    end 

    def ask_user_health#3
        check_if_signed()
        puts "1, create health. 2, look up health. 3, Back to the menu"
        #press 1 if user want to create health, press 2 if user want to look up health"
        number = STDIN.gets.chomp
        if number == "1"
            create_user_health()
        elsif number == "2"
            look_up_health()
        elsif number == "3"
           menu
        end 

    end


    def create_user_health#4
        check_if_signed()
        puts "feels awkward, we won't reveal your name to others!"
        puts "enter your health's name here"
        healthproblem = STDIN.gets.chomp
        puts "enter your date" 
        date_of = STDIN.gets.chomp
        problem = Health.create(name: healthproblem, date: date_of)
        puts "1, create solution. 2, look up solution 3, back to menu" 
        number = STDIN.gets.chomp
        if number == "1"
            selfhelp = STDIN.gets.chomp 
            Solution.create(user_id: @signed.id, health_id: problem.id, self_help: selfhelp)
            write_a_solution()
        elsif number == "2"
            get_solution_from_health
        elsif number == "3"
            menu
        end 

    end 

    def get_health_by_user
        check_if_signed
        finded_health = Health.find_by(name: looked_up_health)
        go_back_menu
    end


    def look_up_health#5
        puts "enter the name of health you want to search for"
        looked_up_health = STDIN.gets.chomp
        finded_health = Health.find_by(name: looked_up_health)
        puts finded_health.inspect
        go_back_menu
        # puts "1, create solution. 2, look up solution. 3, back to menu"
        # number = STDIN.gets.chomp
        # if number == 1
        #     puts "enter your solution"
        #     selfhelp = STDIN.gets.chomp
        #     Solution.create(user_id: user.id, health_id: finded_health.id, self_help: selfhelp)
        # elsif number == 2
        #     get_solution_from_health
        # elsif number == 3 
        #     menu
        # end 
    end 


    def get_solution_from_health #6
        puts "thinking of developing a self-care plan but not sure how to start, we can help you with that!"
        puts "Enter a health name to get started:"
        health = STDIN.gets.chomp
        finded = Health.find_by(name: health)
        puts finded.solutions.inspect
        go_back_menu
    end

    # def show_solutions(solutions)
    #     #solutions.each do |solutions|

    #     # How could we output this solution's content and the username associated with it? 
    #     end 
    # end 

    def write_a_solution()#7
        #active users
        check_if_signed
        puts "thnking of good recommandation? welcome to share your knowledge and experiences"
        puts "write your self-help solution."
        selfhelp = STDIN.gets.chomp
        puts "enter your health problem"
        h_p = STDIN.gets.chomp
        puts "enter your community"
        community = STDIN.gets.chomp
        finded = Health.find_by(name: h_p)
        Solution.create(user_id: @signed.id, health_id: finded.id, self_help: selfhelp, community: community)
        go_back_menu
    end 

    def delete_user#8
        puts 'enter your name so that you can delete your account'
        name_want_to_delete = STDIN.gets.chomp
        user = User.find_by(name: name_want_to_delete)
        user.destroy
    end 

    def update_user
        check_if_signed
        puts "reset the age"
        age = STDIN.gets.chomp
        puts "reset the name"
        name = STDIN.gets.chomp
        puts "reset the background"
        background = STDIN.gets.chomp
        user = User.find_by(name: @signed)
        user.update(name: name,age: age, background: background)
        go_back_menu
    end 

    def check_if_signed
        if @signed == nil
            puts "you need to sign in first. going back to menu" 
            menu
        end
    end

    def go_back_menu
        puts "shall we go back to menu? yes/no"
        decision = STDIN.gets.chomp
        if decision == "yes"
            menu
        end 
    end


    
end 
binding.pry
0
