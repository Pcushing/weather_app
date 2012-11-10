class StaticController < ApplicationController
  def home
  end
  
  def receiver
    @sms_text = params[:body]
    @sms_number = params[:from]
    
    warn "T"*50
    warn @sms_number
    
    @user = User.find_by_phone(@sms_number)
    warn @user
    @user.contacts.each do |contact|
      send_sms_to contact
    end
    respond_to_sender
    respond_to do |format|
        format.xml { render xml: @response.text }
    end
  end
  
  private
    def send_sms_to(contact)
      account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
      auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'
      
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.sms.messages.create(
        :from => '+19789653430',
        :to => contact.phone,
        :body => @sms_text
      )
    end
    
    def respond_to_sender
      @response = Twilio::TwiML::Response.new do |r|
        r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
      end
    end
end
