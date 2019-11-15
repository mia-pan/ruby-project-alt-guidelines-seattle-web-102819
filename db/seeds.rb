User.destroy_all
Health.destroy_all
Solution.destroy_all


User.create(name:"mia", age: 66, background: "artist")
User.create(name:"acac", age: 22, background: "student")
User.create(name:"bebe", age: 33, background: "teacher")
User.create(name:"cici", age: 44, background: "freelancer")
User.create(name:"dede", age: 55, background: "developer")

Health.create(name: "mood disorders", date: 30)
Health.create(name: "anxiety disorders", date: 10)
Health.create(name: "eating disorders", date: 20)
Health.create(name: "trauma-related disorders", date: 10)
Health.create(name: "stressful", date: 5)

Solution.create(health_id: Health.find_by(name: "mood disorders").id, user_id: User.find_by(name: "mia").id, self_help: "books", community: "Bookclub")
Solution.create(health_id: Health.find_by(name: "anxiety disorders").id, user_id: User.find_by(name: "acac").id, self_help: "yoga", community: "Yogateam")
Solution.create(health_id: Health.find_by(name: "eating disorders").id, user_id: User.find_by(name: "bebe").id, self_help: "meditation", community: "Meditationgroup")
Solution.create(health_id: Health.find_by(name: "trauma-related disorders").id, user_id: User.find_by(name: "cici").id, self_help: "books", community: "Bookclub")
Solution.create(health_id: Health.find_by(name: "stressful").id, user_id: User.find_by(name: "dede").id, self_help: "music", community: "Sharemusic")
Solution.create(health_id: Health.find_by(name: "mood disorders").id, user_id: User.find_by(name: "acac").id, self_help: "experience", community: "Funexperience")
Solution.create(health_id: Health.find_by(name: "stressful").id, user_id: User.find_by(name: "bebe").id, self_help: "yoga", community: "Yogateam")


#User.create(name: "mia", age: 66, background: "artist")
# User.create(name: "acac", age: 22, background: "student")
# User.create(name: "bebe", age: 33, background: "teacher")
# User.create(name: "cici", age: 44, background: "freelancer")
# User.create(name: "dede", age: 55, background: "developer")

# Health.create(type: "mood disorders", date: 30)
# Health.create(type: "anxiety disorders", date: 10)
# Health.create(type: "eating disorders", date: 20)
# Health.create(type: "trauma-related disorders", date: 10)
# Health.create(type: "stressful", date: 5)

# Solution.create(user_id: 1, health_id:1, self_help: "books", community: "Bookclub")
# Solution.create(user_id: 1, health_id:2, self_help: "yoga", community: "Yogateam")
# Solution.create(user_id: 1, health_id:3, self_help: "meditation", community: "Meditaiongroup")
# Solution.create(user_id: 1, health_id:4, self_help: "books", community: "Bookclub")
# Solution.create(user_id: 2, health_id:1, self_help: "music", community: "sharemusic")
# Solution.create(user_id: 3, health_id:2, self_help: "experience", community: "Funexperience")
# Solution.create(user_id: 4, health_id:5, self_help: "yoga", community: "Yogateam")
