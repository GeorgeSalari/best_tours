class AviaToursController < ApplicationController
  before_action :set_avia_tour, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show, :edit]
  rescue_from NoMethodError, :with => :check_error

  # GET /avia_tours
  # GET /avia_tours.json
  def index
    @avia_tours = AviaTour.order(order_number: :asc)
  end

  # GET /avia_tours/1
  # GET /avia_tours/1.json
  def show
    @comments = Comment.where(tour_type: "AviaTour", tour_id: params[:id])
    @title = @avia_tour.page_title
    @description = @avia_tour.meta_description
  end

  # GET /avia_tours/new
  def new
    if logged_in?
      @avia_tour = AviaTour.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /avia_tours/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /avia_tours
  # POST /avia_tours.json
  def create
    if logged_in?
      @avia_tour = AviaTour.new(avia_tour_params)

      respond_to do |format|
        if @avia_tour.save
          format.html { redirect_to @avia_tour, notice: 'Avia tour was successfully created.' }
          format.json { render :show, status: :created, location: @avia_tour }
        else
          format.html { render :new }
          format.json { render json: @avia_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /avia_tours/1
  # PATCH/PUT /avia_tours/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @avia_tour.update(avia_tour_params)
          format.html { redirect_to @avia_tour, notice: 'Avia tour was successfully updated.' }
          format.json { render :show, status: :ok, location: @avia_tour }
        else
          format.html { render :edit }
          format.json { render json: @avia_tour.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /avia_tours/1
  # DELETE /avia_tours/1.json
  def destroy
    if logged_in?
      @avia_tour.destroy
      respond_to do |format|
        format.html { redirect_to avia_tours_url, notice: 'Avia tour was successfully destroyed.' }
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
    def set_avia_tour
      @avia_tour = AviaTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avia_tour_params
      params.require(:avia_tour).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
    end
end
