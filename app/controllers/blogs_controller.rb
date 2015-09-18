class BlogsController < ApplicationController
  before_filter :is_admin?, only: [:new, :create, :destroy]

  # used for sanitization user's input
  REDACTOR_TAGS = %w(code span div label a br p b i del strike u img video audio
                  iframe object embed param blockquote mark cite small ul ol li
                  hr dl dt dd sup sub big pre code figure figcaption strong em
                  table tr td th tbody thead tfoot h1 h2 h3 h4 h5 h6)
  REDACTOR_ATTRIBUTES = %w(href)

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
    params[:content] = sanitize_redactor(params[:content])
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

    def sanitize_redactor(orig_text)
      stripped = view_context.strip_tags(orig_text)
      if stripped.present? # this prevents from creating empty comments
        view_context.sanitize(orig_text, tags: REDACTOR_TAGS, attributes: REDACTOR_ATTRIBUTES)
      else
        nil
      end
    end

end
