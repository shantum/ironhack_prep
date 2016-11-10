class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  end

  def destroy
  end

  def create
    #create new contact from params[:contact]
    contact = Contact.new(:Name => params[:contact][:Name], :Address => params[:contact][:Address], :Phone => params[:contact][:Phone], :Email => params[:contact][:Email])

    #save the contact
    contact.save

    #redirect to /contacts
    redirect_to("/contacts")
  end
end
