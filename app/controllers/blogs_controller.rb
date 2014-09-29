class BlogsController < ApplicationController
  before_filter :is_admin?, only: [:new, :create, :destroy]

  def index
    @blog_posts = Blog.all.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @blog = Blog.find(params[:id])
    @other_posts = Blog.last(5)
  end

  def new
    @blog_post = Blog.new
  end

  def edit
    @blog_post = Blog.find(params[:id])
  end

  def update
    @blog_post = Blog.find(params[:id])
    @blog_post.update(blog_params)

    if @blog_post.save
      redirect_to blogs_url, notice: "Your edits were successfully saved!" 
    end
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
      params.require(:blog).permit(:content, :date, :title)
    end

end
