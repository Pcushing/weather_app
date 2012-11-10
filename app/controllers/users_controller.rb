class UsersController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    request = JSON.parse(params.to_json).symbolize_keys!
    user_params = request[:user]
    contacts_params = request[:contacts]
    warn "T"*50
    warn contacts_params.inspect
    
    @user = User.new(phone: user_params["phone"],
                     email: user_params["email"]
                     )
    respond_to do |format|
       if @user.save
         @user.create_contacts contacts_params
         format.json { render json: @item, status: :created, location: @item }
       else
         format.json { 'something went wrong' }
       end 
    end
  end
end