class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show]
  rescue_from NoMethodError, :with => :check_error

  # GET /boats
  # GET /boats.json
  def index
    @boats = Boat.order(order_number: :asc)
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    @comments = Comment.where(tour_type: "Boat", tour_id: params[:id])
    @title = @boat.page_title
    @description = @boat.meta_description
  end

  # GET /boats/new
  def new
    if logged_in?
      @boat = Boat.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /boats/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /boats
  # POST /boats.json
  def create
    if logged_in?
      @boat = Boat.new(boat_params)

      respond_to do |format|
        if @boat.save
          format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
          format.json { render :show, status: :created, location: @boat }
        else
          format.html { render :new }
          format.json { render json: @boat.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @boat.update(boat_params)
          format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
          format.json { render :show, status: :ok, location: @boat }
        else
          format.html { render :edit }
          format.json { render json: @boat.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    if logged_in?
      @boat.destroy
      respond_to do |format|
        format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
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
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
    end
end
