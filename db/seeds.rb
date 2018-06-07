# frozen_string_literal: true

def spacing(name)
  puts("\n============= Seeding: #{name}")
  p("====================================================")
end

if User.first.nil?
  spacing('Loi')
  loi = User.create!(email: 'datloiboi@gmail.com',
                     password: 'asdfas',
                     password_confirmation: 'asdfas',
                     first_name: 'Loi',
                     last_name: 'Tran',
                     city: 'Ho Chi Minh City',
                     country: 'Vietnam',
                     occupation: 'Developer',
                     description: "People told me stop, you're crazy. I said fuck it, I'm doing it anyway.")

  (1..5).to_a.each do |file|
  image_path = "#{Dir.pwd}/db/people/loi/#{file}.jpg"
    loi.profile_photos.create!
    upload = loi.uploads.create!(uploadable_id: 1, uploadable_type: ProfilePhoto, media_type: 'img')
    upload.media.attach(
      io: File.open(image_path),
      filename: "#{file}.jpg",
      content_type: 'application/jpg'
    )
  end

  people = [
    { first_name: 'Charles', last_name: 'Lee', email: 'charles@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Developer', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Christine', last_name: 'Nguyen', email: 'christine@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Columbida', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Do', last_name: 'Le', email: 'do@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Chanel', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Duc', last_name: 'Viettel', email: 'duc@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Director', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Gigi', last_name: 'Pham', email: 'gigi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Loan Officer', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Harley', last_name: 'Dinh', email: 'harley@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Head of Engineering', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Hien', last_name: 'Nguyen', email: 'hien@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Sales Director', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Kas', last_name: 'Patel', email: 'vikas@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Business Owner', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Khanh', last_name: 'Vo', email: 'khanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Photographer', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Linh', last_name: 'Ha', email: 'linh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'KTV Manager', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Mikey', last_name: 'Banks', email: 'mikey@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Business Owner', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Mimi', last_name: 'Doan', email: 'mimi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'College Student', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'My', last_name: 'Pham', email: 'my@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Account', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Nhung', last_name: 'Tran', email: 'nhung@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Sales & Marketing', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Phan', last_name: 'Bui', email: 'phan@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Digital Nomad', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Phuong', last_name: 'Tran', email: 'phuong@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Dealer', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Tai', last_name: 'Tran', email: 'tai@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Registered Nurse', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Thanh', last_name: 'Boo', email: 'thanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Startup Founder', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Thao', last_name: 'Tran', email: 'thao@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Information Technology', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Uyen', last_name: 'Dang', email: 'uyen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Registered Nurse', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Van', last_name: 'Luu', email: 'van@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Makeup Artist', description: Faker::Lorem.paragraph(5, true, 10) },
    { first_name: 'Yen', last_name: 'Nguyen', email: 'yen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas', city: 'Ho Chi Minh City', country: 'Vietnam', occupation: 'Business owner', description: Faker::Lorem.paragraph(5, true, 10) }
  ]

  people.each do |person|
    spacing("User: #{person[:first_name]}")

    name = person[:first_name].downcase
    user = User.create!(person)

    (1..5).to_a.each do |file|
      image_path = "#{Dir.pwd}/db/people/#{name}/#{file}.jpg"
      user.profile_photos.create!
      upload = user.uploads.create!(uploadable_id: user.id, uploadable_type: ProfilePhoto, media_type: 'img')
      upload.media.attach(
        io: File.open(image_path),
        filename: "#{file}.jpg",
        content_type: 'application/jpg'
      )
    end
  end

  other_users = User.all.to_a

  User.all.each do |user|
    other_users.shift
    other_users.each do |other_user|
      conversation = Conversation.create!

      user.user_conversations.create!(conversation: conversation)
      other_user.user_conversations.create!(conversation: conversation)

      Friendship.create!(user: user, friend_id: other_user.id, status: 0)
      Friendship.create!(user_id: other_user.id, friend_id: user.id, status: 0)

      participants = conversation.users.collect(&:first_name).join(' & ')
      spacing('Conversations & Friendships')
      p "Conversation & Friendships between: #{participants}"
    end
  end
end

if Stage.first.nil?
  spacing('Stages')
  stages = [
    { name: 'Bar2000', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 6', address: '171 Chợ Lớn', phone: '+84 28 3876 6217' },
    { name: '212', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '212 Nguyễn Trãi', phone: '+84 12 174 9131' },
    { name: 'EnvyNightClub', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '74-76 Nam Kỳ Khởi Nghĩa', phone: '+84 28 3913 8168' },
    { name: 'Glow', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '93 Nguyễn Du, Bến Nghé', phone: '+84 93 887 4569' },
    { name: 'Lush', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '2 Lý Tự Trọng, Bến Nghé', phone: '+84 91 863 0742' },
    { name: 'ApocalypseNow', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '2B Thi Sách', phone: '+84 28 3825 6124' },
    { name: 'RepublicClub', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: '19 Đỗ Quang Đẩu', phone: '+84 90 236 8592' },
    { name: 'ChillSkyBar', city: 'Hồ Chí Minh', country: 'Vietnam', district: 'Quận 1', address: 'AB Tower, 76A Lê Lai', phone: '+84 93 882 2838' }
  ]

  stages.each do |stage|
    stage = Stage.create!(stage)

    (1..3).to_a.each do |idx|
      user = User.first
      image_path = "#{Dir.pwd}/db/stages/#{stage[:name]}/cover_photos/#{idx}.jpg"
      ProfilePhoto.create!(user: user)
      upload = stage.uploads.create!(uploadable_id: stage.id, uploadable_type: ProfilePhoto, user: user, stage_id: stage.id, media_type: 'img')
      upload.media.attach(io: File.open(image_path), filename: "#{idx}.jpg", content_type: 'application/jpg')
    end

    stage_conversation = stage.conversations.create!(name: stage.name)

    User.all.each do |user|
      spacing('Stage Conversations')
      user.user_conversations.create!(conversation: stage_conversation)
    end
  end
end

if Post.first.nil?
  spacing('Posts')
  types = ['like', 'heart', 'wow', 'laugh', 'sad']

  5.times do
    post = Post.new(
      user_id: User.all.sample.id,
      body: Faker::Lorem.paragraphs((1..3).to_a.sample, true).join(' ')
    )
    post.created_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
    post.save

    (1..3).to_a.sample.times do
      spacing('Comments')
      post.comments.create!(user_id: User.all.sample.id, body: Faker::Lorem.paragraph(1, true, 5))
    end
    (0..7).to_a.sample.times do
      spacing('Reactions')
      post.reactions.create!(user_id: User.all.sample.id, reaction_type: types.sample)
    end
  end
end


if Message.first.nil?
  private_conversations = Conversation.where(stage_id: nil)

  private_conversations.each do |conversation|
    spacing('Private Conversations')
    user_ids = conversation.users.to_a.collect(&:id)
    messages_count = (5..15).to_a.sample
    messages_count.times do
      Message.create!(user_id: user_ids.sample, conversation: conversation, body: Faker::Lorem.paragraph(1, true, 6))
    end
  end

  stage_conversations = Conversation.where.not(stage_id: nil)

  stage_conversations.each do |conversation|
    spacing('Stage Conversations')
    user_ids = conversation.users.to_a.collect(&:id)
    messages_count = (10..20).to_a.sample
    messages_count.times do
      message = Message.create!(user_id: user_ids.sample, conversation: conversation, body: Faker::Lorem.paragraph(1, true, 8))
    end
  end

  (1..4).to_a.each do |num|
    stage_conversation = Conversation.where.not(stage_id: nil)[num]
    stage = stage_conversation.stage
    count = 1

    while count < 4
      video = (1..8).to_a
      spacing('Stage Uploads')
      message = stage_conversation.messages.sample
      upload = Upload.new(uploadable_id: message.id, uploadable_type: Message, user_id: message.user.id, stage_id: stage.id, media_type: 'vid')
      upload.save
      image_path = "#{Dir.pwd}/db/stages/Bar2000/partying#{video.sample}.mp4"
      upload.media.attach(
        io: File.open(image_path),
        filename: "partying#{video.sample}.mp4",
        content_type: 'video'
      )
      count += 1
    end
  end
end