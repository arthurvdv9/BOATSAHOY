class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @boats = Boat.where(user_id: current_user)
  end

end
