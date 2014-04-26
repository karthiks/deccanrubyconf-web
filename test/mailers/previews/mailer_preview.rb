class MailerPreview < ActionMailer::Preview

  def dummy_mailer
    Mailer.dummy_mailer('vipul@bigbinary.com')
  end
end