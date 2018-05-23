unless User.find_by email: 'datloiboi@gmail.com'
  User.create!(email: 'datloiboi@gmail.com',
               password: 'asdfas',
               password_confirmation: 'asdfas',
               first_name: 'Loi',
               last_name: 'Tran')
end

puts "\nSeeding Stages"
Stage.create name: 'Vinhomes Landmark 3'

puts "Seeding Posts"
25.times do
  post = Post.new(
    user_id: 1,
    body: Faker::Lorem.paragraphs((1..5).to_a.sample, true).join(' ')
  )
  post.created_at = Faker::Time.between(DateTime.now - 7, DateTime.now)
  post.save
end
