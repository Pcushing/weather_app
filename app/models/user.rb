class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  validates_presence_of :phone, :on => :create, :message => "can't be blank"
  has_many :contacts
end
