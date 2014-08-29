class BlogsController < ApplicationController
  before_filter :is_admin?, only: [:new, :create, :destroy]

  def index
    @blog_posts = Blog.all
  end

  def new
    @blog_post = Blog.new
  end

  def create
    @blog_post = Blog.new(blog_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blogs_url, notice: "Post was successfully created!" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
  end

  private

    def blog_params
      params.require(:blog).permit(:content, :date)
    end

end
