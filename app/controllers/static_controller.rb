class StaticController < ApplicationController
  def home
    account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
    auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.sms.messages.create(
      :from => '+19789653430',
      :to => '+19788525267',
      :body => "We're live with Twilio!"
    )
  end
  
  def receiver
    # {"AccountSid"=>"ACa2fd753d813c6b10be9a38af65653e6b", "Body"=>"Sgain", 
    # "ToZip"=>"01843", "FromState"=>"MA", "ToCity"=>"LAWRENCE", 
    # "SmsSid"=>"SMd829a915a88f53b4bfb5e75ac1be3d92", "ToState"=>"MA", 
    # "To"=>"+19789653430", "ToCountry"=>"US", "FromCountry"=>"US", 
    # "SmsMessageSid"=>"SMd829a915a88f53b4bfb5e75ac1be3d92", "ApiVersion"=>"2010-04-01", 
    # "FromCity"=>"LAWRENCE", "SmsStatus"=>"received", "From"=>"+19788525267", "FromZip"=>"01720"}
    warn "*"*50
    warn "Text body"
    sms_text = params(:body)
    warn "Text number"
    sms_number = params(:from)
    
    response = Twilio::TwiML::Response.new do |r|
      r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
    end

    respond_to do |format|
        format.xml { render xml: response.text }
    end
  end
end
