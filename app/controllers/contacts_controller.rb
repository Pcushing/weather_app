class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      redirect_to contacts_path, notice: "Contact deleted"
    end
  end
end