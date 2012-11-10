class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :user_id
end
