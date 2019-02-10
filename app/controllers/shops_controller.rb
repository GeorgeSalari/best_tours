class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :new_order, :new_call_order, only: [:index, :show]
  rescue_from NoMethodError, :with => :check_error

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.order(order_number: :asc)
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @comments = Comment.where(tour_type: "Shop", tour_id: params[:id])
    @title = @shop.page_title
    @description = @shop.meta_description
  end

  # GET /shops/new
  def new
    if logged_in?
      @shop = Shop.new
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # GET /shops/1/edit
  def edit
    if !logged_in?
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # POST /shops
  # POST /shops.json
  def create
    if logged_in?
      @shop = Shop.new(shop_params)

      respond_to do |format|
        if @shop.save
          format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
          format.json { render :show, status: :created, location: @shop }
        else
          format.html { render :new }
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    if logged_in?
      respond_to do |format|
        if @shop.update(shop_params)
          format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
          format.json { render :show, status: :ok, location: @shop }
        else
          format.html { render :edit }
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:success] = 'У вас нет доступа!'
      redirect_to root_path
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    if logged_in?
      @shop.destroy
      respond_to do |format|
        format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
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
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:meta_description, :page_title, :title, :short_content, :content, :adult_price, :order_number, :child_price, {images: []})
    end
end
