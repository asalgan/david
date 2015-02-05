class ContactsController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      respond_to do |format|
      if @contact.deliver
        format.html { redirect_to new_contact_path, notice: "Thank you for your message, we'll get back to you shortly!" }
      else
        render :nothing => true
        flash.now[:error] = 'Cannot send message.'
      end
    end
  end
  
end
