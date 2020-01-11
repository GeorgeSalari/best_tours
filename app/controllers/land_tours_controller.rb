class LandToursController < ApplicationController
  before_action :set_land_tour, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show, :edit]
  rescue_from NoMethodError, :with => :check_error

  # GET /land_tours
  # GET /land_tours.json
  def index
    @land_tours = LandTour.order(order_number: :asc)
  end

  # GET /land_tours/1
  # GET /land_tours/1.json
  def show
    @comments = Comment.where(tour_type: "LandTour", tour_id: params[:id])
    @title = @land_tour.page_title
    @description = @land_tour.meta_description
  end

  # GET /land_tours/new
  def new
    if logged_in?
      @land_tour = LandTour.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /land_tours/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /land_tours
  # POST /land_tours.json
  def create
    if logged_in?
      @land_tour = LandTour.new(land_tour_params)

      respond_to do |format|
        if @land_tour.save
          format.html { redirect_to @land_tour, notice: 'Land tour was successfully created.' }
          format.json { render :show, status: :created, location: @land_tour }
        else
          format.html { render :new }
          format.json { render json: @land_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /land_tours/1
  # PATCH/PUT /land_tours/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @land_tour.update(land_tour_params)
          format.html { redirect_to @land_tour, notice: 'Land tour was successfully updated.' }
          format.json { render :show, status: :ok, location: @land_tour }
        else
          format.html { render :edit }
          format.json { render json: @land_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /land_tours/1
  # DELETE /land_tours/1.json
  def destroy
    if logged_in?
      @land_tour.destroy
      respond_to do |format|
        format.html { redirect_to land_tours_url, notice: 'Land tour was successfully destroyed.' }
        format.json { head :no_content }
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
  def set_land_tour
    @land_tour = LandTour.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def land_tour_params
    params.require(:land_tour).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
  end
end
