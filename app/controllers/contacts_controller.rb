class ContactsController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      respond_to do |format|
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        format.js
      else
        flash.now[:error] = 'Cannot send message.'
        render :new
      end
    end
  end
  
end
