class StaticController < ApplicationController
  def home
  end
  
  def receiver
    # account_sid = 'ACa2fd753d813c6b10be9a38af65653e6b'
    # auth_token = '2601077aa3fa59bbc7a6c5459f8beafc'
    # 
    # @client = Twilio::REST::Client.new account_sid, auth_token
    # 
    # @sms_text = params[:body]
    # @sms_number = params[:from]
    # 
    # warn "T"*50
    # warn params[:from]
    # warn params[:body]
    # 
    # @user = User.find_by_phone(@sms_number)
    # warn @user
    # 
    # @user.contacts.each do |contact|
    #   @client.account.sms.messages.create(
    #     :from => '+19789653430',
    #     :to => contact.phone,
    #     :body => @sms_text
    #   )
    # end
    
    warn "T"*50
    warn params.inspect
    warn params[:from]
    warn params[:body]
    
    @response = Twilio::TwiML::Response.new do |r|
      r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
    end
    respond_to do |format|
        format.xml { render xml: @response.text }
    end
  end

end
