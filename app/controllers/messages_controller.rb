class MessagesController < ApplicationController
  
  def new
    @body = params[:Body].split("#").first.strip
    # @options = params[:Body].split("#")[1..-1]
    @message = Message.new(body: @body, phone: params[:From])    
    if @message.save
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