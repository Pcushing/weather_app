class StaticController < ApplicationController
  def home
  end
  
  def receiver
    warn "T"*50
    warn params.inspect
    warn params[:Body]
    warn params[:From]
    
    # account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
    # auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'
    # 
    # @client = Twilio::REST::Client.new account_sid, auth_token
    
    @sms_text = params[:Body]
    @sms_number = params[:From]
    
    @user = User.find_by_phone(@sms_number)  
    warn @user.inspect  
    # @user.contacts.each do |contact|
    #   @client.account.sms.messages.create(
    #     :from => '+19789653430',
    #     :to => contact.phone,
    #     :body => @sms_text
    #   )
    # end
    
    @response = Twilio::TwiML::Response.new do |r|
      r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
    end
    respond_to do |format|
        format.xml { render xml: @response.text }
    end
  end

end
