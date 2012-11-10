class Message < ActiveRecord::Base
  attr_accessible :body, :phone
  validates_presence_of :phone, :on => :create, :message => "can't be blank"
  after_create :sms_contacts
  after_create :tweet_311
  after_create :email_contacts
  
  private
    def sms_contacts
      account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
      auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'
      
      @client = Twilio::REST::Client.new account_sid, auth_token
      @user = User.find_by_phone(self.phone)
      warn "II"*50
      warn @user
      warn @user.contacts.inspect
      if !@user.contacts.empty?  
        @user.contacts.each do |contact|
          @client.account.sms.messages.create(
            :from => '+19789653430',
            :to => contact.phone,
            :body => self.body
          )
        end
      end
    end
    
    def email_contacts
      @user = User.find_by_phone(self.phone)
      if !@user.contacts.empty?  
        @user.contacts.each do |contact|
          ContactMailer.new_message(contact, self).deliver
        end
      end
    end
    
    def tweet_311
      Twitter.configure do |config|
        config.consumer_key = '8lqO0hZuSmop8Y40K3gfA'
        config.consumer_secret = 'puY0FgZu1y7fEIMHe3nCEIajVbDSGsQTbEhoX1RmwJA'
        config.oauth_token = '939357421-qAHr2JcSza9zuEGrNZl08KcxqYByJrpeyIWaWX4E'
        config.oauth_token_secret = 'hhajIwKXJ1YxUCobz3Fi5d08eiDkkh3EQBGzZqQbaE'
      end
      Twitter.update(self.body + " 311NYC test")
    end
end
