class ShippingAddressesController < ApplicationController
  before_action :set_shipping_address, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  # GET /shipping_addresses or /shipping_addresses.json
  def index
    @shipping_addresses = ShippingAddress.all
  end

  # GET /shipping_addresses/1 or /shipping_addresses/1.json
  def show
  end

  # GET /shipping_addresses/new
  def new

    @shipping_address = ShippingAddress.new


  end

  # GET /shipping_addresses/1/edit
  def edit
  end



  # POST /shipping_addresses or /shipping_addresses.json
  def create

    @shipping_address =ShippingAddress.new(shipping_address_params)
    respond_to do |format|
      if @shipping_address.save

        redirect_to  new_shipping_address_line_item_url(shipping_address_id: @shipping_address.id),notice: "Delivery address was successfully added."
        return
        # format.html { redirect_to order_url(@shipping_address),notice: "Shipping address was successfully created. Your order is completed" }
        # format.json { render :show, status: :created, location: @shipping_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_addresses/1 or /shipping_addresses/1.json
  def update
    respond_to do |format|
      if @shipping_address.update(shipping_address_params)
        redirect_to  new_shipping_address_line_item_url(shipping_address_id: @shipping_address.id),notice: "Delivery address was successfully updated."
        return;
        # format.html { redirect_to shipping_address_url(@shipping_address), notice: "Shipping address was successfully updated." }
        # format.json { render :show, status: :ok, location: @shipping_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_addresses/1 or /shipping_addresses/1.json
  def destroy
    @shipping_address.destroy

    respond_to do |format|
      format.html { redirect_to shipping_addresses_url, notice: "Shipping address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_address
      @shipping_address = ShippingAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_address_params
      params.fetch(:shipping_address,{}).permit(:address_name,:address_line1,:address_line2,:address_city,:address_state,:address_zip)

    end

end


# class ShippingAddressesController < ApplicationController
#   before_action :set_shipping_address, only: %i[ show edit update destroy ]
#   before_action :authenticate_user!


#   # GET /shipping_addresses or /shipping_addresses.json
#   def index
#     @shipping_addresses = ShippingAddress.all
#   end

#   # GET /shipping_addresses/1 or /shipping_addresses/1.json
#   def show
#   end

#   # GET /shipping_addresses/new
#   def new

#     @shipping_address = ShippingAddress.new


#   end

#   def add_new
#     # @shipping_address = ShippingAddress.new

#     # render :new
#   end

#   # GET /shipping_addresses/1/edit
#   def edit
#   end



#   # POST /shipping_addresses or /shipping_addresses.json
#   def create

#     @shipping_address =ShippingAddress.new(shipping_address_params)
#     respond_to do |format|
#       if @shipping_address.save

#         redirect_to  new_shipping_address_line_item_url(shipping_address_id: @shipping_address.id),notice: "Delivery address was successfully added."
#         return
#         # format.html { redirect_to order_url(@shipping_address),notice: "Shipping address was successfully created. Your order is completed" }
#         # format.json { render :show, status: :created, location: @shipping_address }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
#       end
#     end
#   end


#   # POST /shipping_addresses or /shipping_addresses.json
#   def create_new_address

#     @shipping_address =ShippingAddress.new(shipping_address_params)
#     respond_to do |format|
#       if @shipping_address.save

#         redirect_to  new_shipping_address_line_item_url(shipping_address_id: @shipping_address.id),notice: "Delivery address was successfully added."
#         return
#         # format.html { redirect_to order_url(@shipping_address),notice: "Shipping address was successfully created. Your order is completed" }
#         # format.json { render :show, status: :created, location: @shipping_address }
#       else
#         format.html { render :add_new, status: :unprocessable_entity }
#         format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def reuse_address


#     redirect_to  new_shipping_address_line_item_url(shipping_address_id: reuse_shipping_address_params[:id]),notice: "Using previouse address"

#   end

#   # PATCH/PUT /shipping_addresses/1 or /shipping_addresses/1.json
#   def update
#     respond_to do |format|
#       if @shipping_address.update(shipping_address_params)
#         redirect_to  new_shipping_address_line_item_url(shipping_address_id: @shipping_address.id),notice: "Delivery address was successfully updated."
#         return;
#         # format.html { redirect_to shipping_address_url(@shipping_address), notice: "Shipping address was successfully updated." }
#         # format.json { render :show, status: :ok, location: @shipping_address }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /shipping_addresses/1 or /shipping_addresses/1.json
#   def destroy
#     @shipping_address.destroy

#     respond_to do |format|
#       format.html { redirect_to shipping_addresses_url, notice: "Shipping address was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_shipping_address
#       @shipping_address = ShippingAddress.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def shipping_address_params
#       params.fetch(:shipping_address,{}).permit(:address_name,:address_line1,:address_line2,:address_city,:address_state,:address_zip)

#     end
#     def reuse_shipping_address_params
#       params.permit(:id)

#     end


# end
