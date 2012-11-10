class Message < ActiveRecord::Base
  attr_accessible :body, :phone
  
  after_create :sms_contacts
  
  private
    def sms_contacts
      account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
      auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'
      
      @client = Twilio::REST::Client.new account_sid, auth_token
      @user = User.find_by_phone(self.phone)  
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
end
