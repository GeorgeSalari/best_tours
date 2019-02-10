class SeaToursController < ApplicationController
  before_action :set_sea_tour, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show]
  # rescue_from NoMethodError, :with => :check_error

  # GET /sea_tours
  # GET /sea_tours.json
  def index
    @sea_tours = SeaTour.order(order_number: :asc)
  end

  # GET /sea_tours/1
  # GET /sea_tours/1.json
  def show
    @comments = Comment.where(tour_type: "SeaTour", tour_id: params[:id])
    @title = @sea_tour.page_title
    @description = @sea_tour.meta_description
  end

  # GET /sea_tours/new
  def new
    if logged_in?
      @sea_tour = SeaTour.new
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

  # POST /sea_tours
  # POST /sea_tours.json
  def create
    if logged_in?
      @sea_tour = SeaTour.new(sea_tour_params)

      respond_to do |format|
        if @sea_tour.save
          format.html { redirect_to @sea_tour, notice: 'Sea tour was successfully created.' }
          format.json { render :show, status: :created, location: @sea_tour }
        else
          format.html { render :new }
          format.json { render json: @sea_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /sea_tours/1
  # PATCH/PUT /sea_tours/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @sea_tour.update(sea_tour_params)
          format.html { redirect_to @sea_tour, notice: 'Sea tour was successfully updated.' }
          format.json { render :show, status: :ok, location: @sea_tour }
        else
          format.html { render :edit }
          format.json { render json: @sea_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /sea_tours/1
  # DELETE /sea_tours/1.json
  def destroy
    if logged_in?
      @sea_tour.destroy
      respond_to do |format|
        format.html { redirect_to sea_tours_url, notice: 'Sea tour was successfully destroyed.' }
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
  def set_sea_tour
    @sea_tour = SeaTour.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sea_tour_params
    params.require(:sea_tour).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
  end
end
