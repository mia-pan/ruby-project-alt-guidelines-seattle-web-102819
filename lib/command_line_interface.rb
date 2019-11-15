# def welcome
#     # puts out a welcome message h
#     puts "Hi world"
#   end
class CommandLineInterface
    def greet 
        puts 'welcome to the whole happy life, the best resource for Self-Care Archives!'
    end 

    def sign_up 
        # sound = Music.new("file_name_for_music.wav")
        # sound.play
        puts "sign up "
        puts "for your security, we don't want to share your personal information to others "
        puts "enter your age"
        sign_up_age = gets.chomp
        puts "enter your name"
        sign_up_name = gets.chomp
        puts "enter your background"
        sign_up_background = gets.chomp
        current_user = User.create(age: sign_up_age, name: sign_up_name, background: sign_up_background)
        ask_user_health(current_user)
    end 

    def sign_in
        puts "welcome back, enter your name"
        sign_in_name = gets.chomp
        signed = User.find_by(sign_in_name)
        puts "press 1 if you want to create a health_problem, press 2 and enter the health if you want to look up health problem"
        number = gets.chomp

        if number == 1
        create_user_health(signed)
        elsif number == 2
            puts "what's the name of the health you are looking on"
            name_looking_on = gets.chomp
            look_up_health(signed, name_looking_on)

    end 

    def ask_user_health(user)
        puts "1, create health. 2, look up health"
        #press 1 if user want to create health, press 2 if user want to look up health"
        number = get.chomp
        if number == 1
            create_user_health(user)
        elsif 
            number == 2
            look_up_health(user, health)
        end 

    end


    def create_user_health(user)
        puts "feels awkward, we won't reveal your name to others!"
        puts "enter your health's name here"
        healthproblem = gets.chomp
        puts "enter your date" 
        date_of = gets.chomp
        problem = Health.create(name: healthproblem, date: date_of)
        puts "1, create solution. 2, look up solution"
        number = gets.chomp
        if number == 1
            selfhelp = gets.chomp 
            Solution.create(user_id: user.id, health_id: problem.id, self_help: selfhelp)
        elsif number == 2
            get_solution_from_health
        end 
    end 

    def look_up_health(user, health)
        puts "1, create solution. 2, look up solution"
        looked_up_health = gets.chomp
        finded_health = Health.find_by(name: looked_up_health)
        number = gets.chomp
        if number == 1
            puts ""
            selfhelp = gets.chomp
            Solution.create(user_id: signed.id, health_id: finded_health.id, self_help: selfhelp)
        elsif number == 2
            get_solution_from_health
        end 
    end 


    def get_solution_from_health
        puts "thinking of developing a self-care plan but not sure how to start, we can help you with that!"
        puts "Enter a health name to get started:"
        health = gets.chomp
        finded = Health.find_by(name: health)
        finded.solutions
        binding.pry
    end

    def show_solutions(solutions)
        #solutions.each do |solutions|

        # How could we output this solution's content and the username associated with it? 
        end 
    end 

    def write_a_solution (signed)
        #active users
        puts "thnking of good recommandation? welcome to share your knowledge and experiences"
        puts "enter your name, health and self-help solution. feel free to add a community"
        selfhelp = gets.chomp
        Solution.create(user_id: signed.id, health_id: problem.id, self_help: selfhelp )
    end 



end 
