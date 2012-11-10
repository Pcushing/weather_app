class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :user_id
  
  belongs_to :user
end
