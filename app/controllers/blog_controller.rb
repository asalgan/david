class BlogController < ApplicationController
	before_filter :is_admin?, only: [:new, :create, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

end
