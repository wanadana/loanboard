class PagesController < ApplicationController
  layout "home"

  def home
    @user = current_user
  end
end
