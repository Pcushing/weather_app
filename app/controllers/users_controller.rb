class UsersController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    warn "T"*50
    warn params.to_s
    request = JSON.parse(params.to_json).symbolize_keys!
    user_params = request[:user]
    warn user_params
    @user = User.new(phone: user_params["phone"],
                     email: user_params["email"]
                     )
    respond_to do |format|
       if @user.save
         format.json { render json: @item, status: :created, location: @item }
       else
         format.json { 'something went wrong' }
       end 
    end
  end
end