class WelcomeController < ApplicationController
  before_action :new_order, :new_call_order, only: :index

  def index
    @sea_tours = SeaTour.all.first(6)
    @land_tours = LandTour.all.first(6)
    @evening_shows = EveningShow.all.first(6)
    @phuket_tours = PhuketTour.all.first(6)
  end
end
