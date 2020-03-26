class ItemsController < ApplicationController

  
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.build_shipping
    # @item.item_images.new
    # @item.build_item_image
    # @shipping = Select.where(fee_burgen_id: params[:feeburgen_id], service_id: params[:service_id], area_id: params[:area_id], handlingtime_id: params[:handlingtime_id])
  end

  def create
    # binding.pry
    # Item.create!(item_params)
    @item = Item.new(item_params)
    #出品中
    @item.trading_status = 0
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :i_text, :condition_id, :category_id, :brand_id, :price, item_image_attributes: [:image_url], shipping_attributes: [:fee_burgen_id, :service_id, :area_id, :handling_time_id]).merge(user_id: current_user.id)
  end

end
