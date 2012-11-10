class ContactMailer < ActionMailer::Base
  include SendGrid
  default from: "no-reply@aqueous-fortress-8839.herokuapp.com"
  
  def mail_contacts(contact, body)
    @contact = contact
    @body = body
    if !contact.email.nil?
      mail(to: contact.email, subject: "Forwarded message from #{contact.user.phone}")
    end
  end
end
