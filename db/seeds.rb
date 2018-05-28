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
                     last_name: 'Tran')

  image_path = "#{Dir.pwd}/db/people/loi.jpg"
  loi.profile_photos.attach(
    io: File.open(image_path),
    filename: 'loi.jpg',
    content_type: 'application/jpg'
  )

  # Example
  # {first_name: '', last_name: '', email: '@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },

  people = [
    { first_name: 'Charles', last_name: 'Lee', email: 'charles@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Christine', last_name: 'Nguyen', email: 'christine@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Do', last_name: 'Le', email: 'do@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Duc', last_name: 'Viettel', email: 'duc@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Gigi', last_name: 'Pham', email: 'gigi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Harley', last_name: 'Dinh', email: 'harley@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Hien', last_name: 'Nguyen', email: 'hien@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Kas', last_name: 'Patel', email: 'vikas@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Khanh', last_name: 'Vo', email: 'khanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Linh', last_name: 'Ha', email: 'linh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Mikey', last_name: 'Banks', email: 'mikey@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Mimi', last_name: 'Doan', email: 'mimi@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'My', last_name: 'Pham', email: 'my@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Nhung', last_name: 'Tran', email: 'nhung@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Phan', last_name: 'Bui', email: 'phan@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Phuong', last_name: 'Tran', email: 'phuong@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Tai', last_name: 'Tran', email: 'tai@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Thanh', last_name: 'Boo', email: 'thanh@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Thao', last_name: 'Tran', email: 'thao@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Uyen', last_name: 'Dang', email: 'uyen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Van', last_name: 'Luu', email: 'van@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' },
    { first_name: 'Yen', last_name: 'Nguyen', email: 'yen@gmail.com', password: 'asdfas', password_confirmation: 'asdfas' }
  ]

  people.each do |person|
    spacing("User: #{person[:first_name]}")

    name = person[:first_name].downcase
    user = User.create!(person)
    image_path = "#{Dir.pwd}/db/people/#{name}.jpg"
    user.profile_photos.attach(
      io: File.open(image_path),
      filename: "#{name}.jpg",
      content_type: 'application/jpg'
    )
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
    { name: 'Bar2000' },
    { name: '212' },
    { name: 'EnvyNightclub' },
    { name: 'Glow' },
    { name: 'Lush' },
    { name: 'ApocalypseNow' },
    { name: 'RepublicClub' },
    { name: 'ChillSkybar' }
  ]

  stages.each do |stage|
    stage = Stage.create!(name: stage[:name])

    (1..3).to_a.each do |idx|
      image_path = "#{Dir.pwd}/db/stages/#{stage[:name]}/cover_photos/#{idx}.jpg"
      stage.cover_photos.attach(io: File.open(image_path), filename: "#{idx}.jpg", content_type: 'application/jpg')
    end

    stage_conversation = stage.conversations.create!(name: stage.name + ' public')

    User.all.each do |user|
      spacing('Stage Conversations')
      user.user_conversations.create!(conversation: stage_conversation)
    end
  end
end

if Post.first.nil?
  spacing('Posts')
  25.times do
    post = Post.new(
      user_id: User.all.sample.id,
      body: Faker::Lorem.paragraphs((1..5).to_a.sample, true).join(' ')
    )
    post.created_at = Faker::Time.between(DateTime.now - 7, DateTime.now)
    post.save
  end
end


if Message.first.nil?
  private_conversations = Conversation.where(stage_id: nil)

  private_conversations.each do |conversation|
    # spacing('Private Conversations')
    user_ids = conversation.users.to_a.collect(&:id)
    messages_count = (10..50).to_a.sample
    messages_count.times do
      Message.create!(user_id: user_ids.sample, conversation: conversation, body: Faker::Lorem.paragraph(1, true, 5))
    end
  end

  stage_conversations = Conversation.where.not(stage_id: nil)

  stage_conversations.each do |conversation|
    # spacing('Stage Conversations')
    user_ids = conversation.users.to_a.collect(&:id)
    messages_count = (10..100).to_a.sample
    messages_count.times do
      message = Message.create!(user_id: user_ids.sample, conversation: conversation, body: Faker::Lorem.paragraph(1, true, 5))
      if (1..7).to_a.sample == 1
        # user = User.all.sample.first_name.downcase
        # image_path = "#{Dir.pwd}/db/people/#{user}.jpg"

        # message.upload.attach(
        #   io: File.open(image_path),
        #   filename: 'loi.jpg',
        #   content_type: 'application/jpg'
        # )
      end
    end
  end
end