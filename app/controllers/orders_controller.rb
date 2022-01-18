class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!
  skip_before_action :authenticate_user!,raise: false


  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new

    @order = Order.new

  end

  # GET /orders/1/edit
  def edit

    @order = Order.find(params[:id])

  end


  def test
    params
      # lineItem = LineItem.new(user_id:current_user.id,)
    if !session[:current_delivery_id].blank?
      respond_to do |format|
        format.json { render :show, status: :created, location: @order }
        
      end
    else
      respond_to do |format|
        format.js
        format.html{ redirect_to @node }
      end
   
    end

  end




  # POST /orders or /orders.json
  def create

    @order = Order.new(order_params)


    respond_to do |format|
      if @order.save

        format.html { redirect_to new_order_shipping_address_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:quantity, :user_id,:food_id,:order_id)
    end
end
