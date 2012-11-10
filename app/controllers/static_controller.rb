class StaticController < ApplicationController
  def home
    # put your own credentials here
    account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
    auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.sms.messages.create(
      :from => '+19789653430',
      :to => '+14088688605',
      :body => "We're live with Twilio!"
    )
  end
  
  def receiver
    # build up a response
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'hello there', :voice => 'woman'
      r.Dial :callerId => '+14159992222' do |d|
        d.Client 'jenny'
      end
    end

    # print the result
    puts response.text
  end
end
