class ImagePostsController < ApplicationController
  def new
    @image_post = ImagePost.new
  end

  def create
    @image_post = ImagePost.new(params[:image_post])
    if @image_post.save
      redirect_to dashboard_path
    else
      flash.now[:notice] = "There were errors posting your image!"
      render :new
    end
  end
end
