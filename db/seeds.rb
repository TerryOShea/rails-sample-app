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