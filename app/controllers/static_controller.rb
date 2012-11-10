class StaticController < ApplicationController
  def home
    # put your own credentials here
    account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
    auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.sms.messages.create(
      :from => '+19789653430',
      :to => '+19788525267',
      :body => "We're live with Twilio!"
    )
  end
  
  def receiver
    response = Twilio::TwiML::Response.new do |r|
      r.Sms 'hello there'
    end

    respond_to do |format|
        format.xml { render xml: response}
    end
  end
end
