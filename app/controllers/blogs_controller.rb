class BlogsController < ApplicationController
  before_filter :is_admin?, only: [:new, :create, :destroy]

  def index
  end

  def new
  	@blog_post = Blog.new
  end

  def create
  	@blog_post = Blog.new

  	respond_to do |format|
      if @blog_post.save
        format.html { redirect_to root_url, notice: "Post was successfully created!" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
  end

end
