class TextItemsController < ApplicationController
  def new
    @text_item = TextItem.new
  end

  def create
    @text_item = TextItem.new(params[:text_item])

    if @text_item.save
      redirect_to dashboard_path, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end
end
