class StaticController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    @user = params[:user]
    respond_to do |format|
       if @user.save
         format.json {  }
       else
         format.json { 'something went wrong' }
       end 
    end
  end
end