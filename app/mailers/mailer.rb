class Mailer < ActionMailer::Base

  layout 'mailer'

  default from: Settings.mailer.default_from_email

  default_url_options[:host] = Settings.mailer.host_for_email_with_www

  def dummy_mailer receipient_email
    mail(to: receipient_email, subject: 'Test Email') do |format|
      format.text
      format.html
    end
  end

end
