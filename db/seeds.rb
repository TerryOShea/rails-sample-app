User.create!(name:  "Rashida Uum", 
             email: "ruum@aol.com", 
             password: "barfood", 
             password_confirmation: "barfood", 
             admin: true, 
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n}@aol.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password, 
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Hipster.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end