class StaticPagesController < ApplicationController
  before_action :new_order, :new_call_order, only: [:individual, :realty_rent, :realty_buy, :transfer, :photoshoot, :wedding, :spa]
  rescue_from NoMethodError, :with => :check_error
  before_action :set_static_page, only: [:edit, :update]

  def individual
    @individual = StaticPage.find(7)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 7)
  end

  def realty_rent
    @realty_rent = StaticPage.find(5)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 5)
  end

  def realty_buy
    @realty_buy = StaticPage.find(6)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 6)
  end

  def transfer
    @transfer = StaticPage.find(4)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 4)
  end

  def photoshoot
    @photoshoot = StaticPage.find(3)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 3)
  end

  def wedding
    @wedding = StaticPage.find(1)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 1)
  end

  def spa
    @spa = StaticPage.find(2)
    @comments = Comment.where(tour_type: "StaticPage", tour_id: 2)
  end

  def new
    if logged_in?
      @static_page = StaticPage.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /sea_tours/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  def create
    if logged_in?
      @static_page = StaticPage.new(static_page_params)

      respond_to do |format|
        if @static_page.save
          format.html { redirect_to @static_page, notice: 'Sea tour was successfully created.' }
          format.json { render :show, status: :created, location: @static_page }
        else
          format.html { render :new }
          format.json { render json: @static_page.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  def update
    if logged_in?
      respond_to do |format|
        if @static_page.update(static_page_params)
          format.html { redirect_to @static_page, notice: 'Sea tour was successfully updated.' }
          format.json { render :show, status: :ok, location: @static_page }
        else
          format.html { render :edit }
          format.json { render json: @static_page.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

private
  def check_error
    flash[:success] = 'Что то пошло не так, извините!'
    redirect_to root_path
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_static_page
    @static_page = StaticPage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def static_page_params
    params.require(:static_page).permit(:title, :short_content, :content, :adult_price, :child_price, {images: []})
  end

end
