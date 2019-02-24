class WelcomeController < ApplicationController
  before_action :new_order, :new_call_order, only: :index
  layout false, only: :sitemap

  def index
    @sea_tours = SeaTour.order(order_number: :asc).first(6)
    @land_tours = LandTour.order(order_number: :asc).first(6)
    @evening_shows = EveningShow.order(order_number: :asc).first(6)
    @phuket_tours = PhuketTour.order(order_number: :asc).first(6)
    @comments = Comment.order(created_at: :desc)
  end

  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml' }
      format.html { redirect_to root_url }
    end
  end

end
