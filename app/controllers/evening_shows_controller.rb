class EveningShowsController < ApplicationController
  before_action :set_evening_show, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show, :edit]
  rescue_from NoMethodError, :with => :check_error

  # GET /evening_shows
  # GET /evening_shows.json
  def index
    @evening_shows = EveningShow.order(order_number: :asc)
  end

  # GET /evening_shows/1
  # GET /evening_shows/1.json
  def show
    @comments = Comment.where(tour_type: "EveningShow", tour_id: params[:id])
    @title = @evening_show.page_title
    @description = @evening_show.meta_description
  end

  # GET /evening_shows/new
  def new
    if logged_in?
      @evening_show = EveningShow.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /evening_shows/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /evening_shows
  # POST /evening_shows.json
  def create
    if logged_in?
      @evening_show = EveningShow.new(evening_show_params)

      respond_to do |format|
        if @evening_show.save
          format.html { redirect_to @evening_show, notice: 'Evening show was successfully created.' }
          format.json { render :show, status: :created, location: @evening_show }
        else
          format.html { render :new }
          format.json { render json: @evening_show.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /evening_shows/1
  # PATCH/PUT /evening_shows/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @evening_show.update(evening_show_params)
          format.html { redirect_to @evening_show, notice: 'Evening show was successfully updated.' }
          format.json { render :show, status: :ok, location: @evening_show }
        else
          format.html { render :edit }
          format.json { render json: @evening_show.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /evening_shows/1
  # DELETE /evening_shows/1.json
  def destroy
    if logged_in?
      @evening_show.destroy
      respond_to do |format|
        format.html { redirect_to evening_shows_url, notice: 'Evening show was successfully destroyed.' }
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
  def set_evening_show
    @evening_show = EveningShow.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def evening_show_params
    params.require(:evening_show).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
  end
end
