class VisitorsController < ApplicationController

  def index
  	@blog_post_previews = Blog.last(3)
  end

end
