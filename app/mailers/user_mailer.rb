class UserMailer < ApplicationMailer
 def test_email
    mail(
      to: 'jameshuynhsg@gmail.com',
      body: 'This is a test email',
      subject: '[Getonstage] Test Email'
    )
  end
end
