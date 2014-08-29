class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

	def is_admin?
	  if current_user.admin?
	    true
	  else
	    redirect_to root_url
	  end
	end

end
