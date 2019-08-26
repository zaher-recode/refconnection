# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Seed the Categories
Category.create([
    {name: "Maintenance Services"},
    {name: "Teaching Services"},
    {name: "Freelance Services"}
    ])

Industry.create([
    {name: "Accounting"},
    {name: "Aeorspace"},
    {name: "Agriculture"},
    {name: "Computer"},
    {name: "Construction"},
    {name: "Education"},
    {name: "Electronics"},
    {name: "Energy"},
    {name: "Entertainment"},
    {name: "Food"},
    {name: "Healthcare"},
    {name: "Hospitality"},
    {name: "Manufacturing"},
    {name: "Music"},
    {name: "Mining"},
    {name: "News Media"},
    {name: "Pharmaceutical"},
    {name: "Telecommunication"},
    {name: "Transport"},
    {name: "Worldwide Web"}
    ])

  Skill.create([
    {name: "Consulting"},
    {name: "Critical thinking"},
    {name: "Data analysis"},
    {name: "Problem solving"},
    {name: "Research"},
    {name: "Administrative"},
    {name: "Business analysis"},
    {name: "Business development"},
    {name: "Business management"},
    {name: "Business storytelling"},
    {name: "Economics"},
    {name: "Communication"},
    {name: "Editiing"},
    {name: "Newsletters"},
    {name: "Nonverbal Communication"},
    {name: "Presentation"},
    {name: "Writing"},
    {name: "Active Listening"},
    {name: "Content Management"},
    {name: "Data Presentation"},
    {name: "Database Administration"},
    {name: "Middleware and Integration Software"},
    {name: "Mobile Development"},
    {name: "Network and Information Security"},
    {name: "Software Engineering"},
    {name: "Software Management"},
    {name: "Storage Systems and Management"},
    {name: "Tech Support"},
    {name: "UI/UX"},
    {name: "User Interface Design"},
    {name: "Web Architecture and Development Framework"},
    {name: "Coaching"},
    {name: "Delegating Tasks"},
    {name: "Leadership"},
    {name: "Negotiation"},
    {name: "Project Management"},
    {name: "Relationship Management"},
    {name: "Strategic Planning"},
    {name: "Channel Marketing"},
    {name: "Content Marketing"},
    {name: "Digital Media"},
    {name: "Market Research"},
    {name: "Media Planning"},
    {name: "Online Marketing"},
    {name: "Public Relations"},
    {name: "Social Media"},
    {name: "Adaptability"},
    {name: "Analytical Reasoning"},
    {name: "Artificial Intelligence (AI)"},
    {name: "Cloud Computing"},
    {name: "Collaboration"},
    {name: "Creativity"},
    {name: "People Management"},
    {name: "Persuasion"},
    {name: "Time Management"},
    {name: "UX Design"},
    {name: "Emotional Intelligence (EQ)"},
    {name: "Customer Relationship Management (CRM) Software"},
    {name: "Mobile Application Development"},
    {name: "Translation"},
    {name: "Video Production"},
    {name: "Corporate Communications"},
    {name: "Industrial Design"},
    {name: "Competitive Strategies"},
    {name: "Digital Marketing"},
    {name: "Animation"},
    {name: "Journalism"},
    {name: "Natural Language Processing"},
    {name: "Sales Leadership"},
    {name: "Software Testing"},
    {name: "Customer Service Systems"},
    {name: "Computer Graphics"},
    {name: "Scientific Computing"}
  ])
    
    password = '123123'
1.upto(5) do |i|
  User.create(
    username: "user-#{i}",
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
