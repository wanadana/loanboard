class PagesController < ApplicationController

  def home
    render layout: "home"
    @user = current_user
  end
end
