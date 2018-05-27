def spacing(name)
  puts("\n\n============= Seeding: #{name}")
  puts('====================================================')
end

if User.first.nil?
  spacing('Users')
  loi = User.create!(email: 'datloiboi@gmail.com',
    password: 'asdfas',
    password_confirmation: 'asdfas',
    first_name: 'Loi',
    last_name: 'Tran'
  )

  image_path = "#{Dir.pwd}/db/people/loi.jpg"
  loi.profile_photos.attach({
    io: File.open(image_path),
    filename: 'loi.jpg',
    content_type: 'application/jpg'
  })

  example = {first_name: '', last_name: '', email: '@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },

  people = [
    {first_name: 'Charles', last_name: 'Lee', email: 'charles@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Christine', last_name: 'Nguyen', email: 'christine@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Do', last_name: 'Le', email: 'do@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Duc', last_name: 'Viettel', email: 'duc@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Gigi', last_name: 'Pham', email: 'gigi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Harley', last_name: 'Dinh', email: 'harley@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Hien', last_name: 'Nguyen', email: 'hien@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Kas', last_name: 'Patel', email: 'vikas@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Khanh', last_name: 'Vo', email: 'khanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Linh', last_name: 'Ha', email: 'linh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Mikey', last_name: 'Banks', email: 'mikey@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Mimi', last_name: 'Doan', email: 'mimi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'My', last_name: 'Pham', email: 'my@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Nhung', last_name: 'Tran', email: 'nhung@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Phan', last_name: 'Bui', email: 'phan@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Phuong', last_name: 'Tran', email: 'phuong@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Tai', last_name: 'Tran', email: 'tai@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Thanh', last_name: 'Boo', email: 'thanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Yen', last_name: 'Tibor', email: 'yen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Thao', last_name: 'Tran', email: 'thao@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Uyen', last_name: 'Dang', email: 'uyen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Van', last_name: 'Luu', email: 'van@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    {first_name: 'Yen', last_name: 'Nguyen', email: 'yen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
  ]

  people.each do |person|
    name = person[:first_name].downcase
    user = User.create!(person)
    image_path = "#{Dir.pwd}/db/people/#{name}.jpg"
    user.profile_photos.attach({
      io: File.open(image_path),
      filename: "#{name}.jpg",
      content_type: 'application/jpg'
    })
  end

  users = User.all.to_a

  users.each do |user|
    other_users = User.where("id != ?", user.id)

    other_users.each do |other_user|
      conversation = Conversation.create!
      user.user_conversations.create!(conversation: conversation)
      other_user.user_conversations.create!(conversation: conversation)
    end
  end
end

if Stage.first.nil?
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
    s.conversations.create!(name: s.name + ' public')
    User.all.each do |user|
      user.user_conversations.create!(stage_id: s.id)
    end
  end
end

if Post.first.nil?
  spacing('Seeding Posts')
  25.times do
    post = Post.new(
      user_id: User.all.sample.id,
      body: Faker::Lorem.paragraphs((1..5).to_a.sample, true).join(' ')
    )
    post.created_at = Faker::Time.between(DateTime.now - 7, DateTime.now)
    post.save
  end
end



