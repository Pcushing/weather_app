class ContactMailer < ActionMailer::Base
  include SendGrid
  default from: "no-reply@aqueous-fortress-8839.herokuapp.com"
  
  def new_message(contact, message)
    @contact = contact
    @message = message
    warn @message.inspect
    if !@contact.email.nil?
      mail(to: contact.email, subject: "Forwarded message from #{contact.user.phone}")
    end
  end
end
