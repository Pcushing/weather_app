class MessagesController < ApplicationController
  
  def new
    @message = Message.new(body: params[:Body], phone: params[:From])    
    if @message.save
      @response = Twilio::TwiML::Response.new do |r|
        r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
      end
      respond_to do |format|
        format.xml { render xml: @response.text }
      end
    else
      @response = Twilio::TwiML::Response.new do |r|
        r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
      end
      respond_to do |format|
        format.xml { render xml: @response.text }
      end
    end
  end
  
  def create
    @message = Message.new(params[:Body], params[:From])    
    if @message.save
      @response = Twilio::TwiML::Response.new do |r|
        r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
      end
      respond_to do |format|
          format.xml { render xml: @response.text }
      end
    end
  end
end