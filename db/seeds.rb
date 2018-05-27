def spacing(name)
  puts("\n\n\n\n============= Seeding: #{name}")
  puts("\n\n\n\n====================================================")
end

spacing('Users')
unless User.find_by email: 'datloiboi@gmail.com'
  user = User.create!(email: 'datloiboi@gmail.com',
    password: 'asdfas',
    password_confirmation: 'asdfas',
    first_name: 'Loi',
    last_name: 'Tran'
  )

  image_path = "#{Dir.pwd}/db/people/loi.jpg"
  user.profile_photos.attach({
    io: File.open(image_path),
    filename: 'loi.jpg',
    content_type: 'application/jpg'
  })
end

spacing('Stages')
stages = [
  {name: 'Bar 2000'},
  {name: '212'},
  {name: 'Envy NightClub'},
  {name: 'Glow'},
  {name: 'Lush'},
  {name: 'Apocalypse Now'},
  {name: 'Republic Club'},
  {name: 'Chill Skybar'}
]

stages.each do |stage|
  s = Stage.create!(name: stage[:name])
  (1..3).to_a.each do |idx|
    image_path = "#{Dir.pwd}/db/stages/#{stage[:name]}/cover_photos/#{idx}.jpg"
    s.cover_photos.attach(io: File.open(image_path), filename: "#{idx}.jpg", content_type: "application/jpg")
  end
end


spacing('Seeding Posts')
25.times do
  post = Post.new(
    user_id: 1,
    body: Faker::Lorem.paragraphs((1..5).to_a.sample, true).join(' ')
  )
  post.created_at = Faker::Time.between(DateTime.now - 7, DateTime.now)
  post.save
end




