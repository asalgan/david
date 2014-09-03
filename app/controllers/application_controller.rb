class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def is_admin?
    if current_user.present? && current_user.admin?
      true
    else
      redirect_to root_url
    end
  end

  def robots                                                                                                                                      
  	robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
  	render :text => robots, :layout => false, :content_type => "text/plain"
	end

end
