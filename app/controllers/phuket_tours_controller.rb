class PhuketToursController < ApplicationController
  before_action :set_phuket_tour, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show]
  rescue_from NoMethodError, :with => :check_error

  # GET /phuket_tours
  # GET /phuket_tours.json
  def index
    @phuket_tours = PhuketTour.order(order_number: :asc)
  end

  # GET /phuket_tours/1
  # GET /phuket_tours/1.json
  def show
    @comments = Comment.where(tour_type: "PhuketTour", tour_id: params[:id])
    @title = @phuket_tour.page_title
    @description = @phuket_tour.meta_description
  end

  # GET /phuket_tours/new
  def new
    if logged_in?
      @phuket_tour = PhuketTour.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /phuket_tours/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /phuket_tours
  # POST /phuket_tours.json
  def create
    if logged_in?
      @phuket_tour = PhuketTour.new(phuket_tour_params)

      respond_to do |format|
        if @phuket_tour.save
          format.html { redirect_to @phuket_tour, notice: 'phuket tour was successfully created.' }
          format.json { render :show, status: :created, location: @phuket_tour }
        else
          format.html { render :new }
          format.json { render json: @phuket_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /phuket_tours/1
  # PATCH/PUT /phuket_tours/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @phuket_tour.update(phuket_tour_params)
          format.html { redirect_to @phuket_tour, notice: 'phuket tour was successfully updated.' }
          format.json { render :show, status: :ok, location: @phuket_tour }
        else
          format.html { render :edit }
          format.json { render json: @phuket_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /phuket_tours/1
  # DELETE /phuket_tours/1.json
  def destroy
    if logged_in?
      @phuket_tour.destroy
      respond_to do |format|
        format.html { redirect_to phuket_tours_url, notice: 'phuket tour was successfully destroyed.' }
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
    def set_phuket_tour
      @phuket_tour = PhuketTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phuket_tour_params
      params.require(:phuket_tour).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
    end
end
