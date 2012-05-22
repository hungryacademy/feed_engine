class TwittersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    session[:authentication_workflow] = socialmedia_path
  end

  def skip_step
    redirect_to dashboard_path, :notice => "You can sign up with your social media accounts by visiting the services section under dashboard"
  end
end
