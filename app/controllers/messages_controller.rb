class MessagesController < ApplicationController
  
  def new
    warn "T"*50
    warn "In new"
    warn params.inspect
    warn params[:Body]
    warn params[:From]
    # @message.create(params[:Body], params[:From])    
    @response = Twilio::TwiML::Response.new do |r|
      r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
    end
    respond_to do |format|
        format.xml { render xml: @response.text }
    end
  end
  
  def create
    warn "T"*50
    warn "In create"
    warn params.inspect
    warn params[:Body]
    warn params[:From]
    @message.create(params[:Body], params[:From])    
    @response = Twilio::TwiML::Response.new do |r|
      r.Sms "Thanks. We've contacted your close contacts. Stay safe!"
    end
    respond_to do |format|
        format.xml { render xml: @response.text }
    end
  end
end