class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    order = Order.find(params[:order_id])

    @line_item =order.line_items.create(amount:order.quantity,food_id:order.food.id)


    respond_to do |format|
        if @line_item.save
          format.html { redirect_to line_item_url(@line_item), notice: "Order Completedd." }
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end

    # redirect_to order_line_items_path(@line_items)
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    @line_item = LineItem.new(line_items_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to order_line_items_url(@line_item), notice: "Line item was successfully created." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.fetch(:line_items, {})
    end
end
