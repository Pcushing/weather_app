class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  validates_presence_of :phone, :on => :create, :message => "can't be blank"
  has_many :contacts
  
  def create_contacts(contacts_params)
    contacts_params.each do |contact|
      self.contacts.create contact
    end
  end
end
