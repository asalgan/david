module SessionsHelper

  def after_sign_in_path_for(resource)
    if current_user.admin?
      new_blog_path
    else
      root_url
    end
  end

end