class UsersController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    # YIKES this is bad code
    request = JSON.parse(params.to_json).symbolize_keys!
    user_params = request[:user]
    contacts_params = request[:contacts] 
    @user = User.new(phone: user_params["phone"], email: user_params["email"])
    respond_to do |format|
       if @user.save
         @user.create_contacts(contacts_params) if !contacts_params.nil?
         format.json { render json: @user.to_json, status: :created, location: @user }
       else
         format.json { 'something went wrong' }
       end 
    end
  end
end