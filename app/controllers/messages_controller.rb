class MessagesController < ApplicationController
  
  def new
    warn "T"*50
    warn params[:Body]
    @body = params[:Body].split("#").first.chomp
    @options = params[:Body].split("#")[1,-1]
    warn @body.inspect
    warn @options.inspect
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