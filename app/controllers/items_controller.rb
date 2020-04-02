class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit,:update,:destroy]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
    @item_images = ItemImage.new
  end

  def new
    @item = Item.new
    @item.build_shipping
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    #出品中
    @item.trading_status = 0
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end
  

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :i_text, :condition_id, :category_id, :brand_id, :price, shipping_attributes: [:id,:fee_burgen_id, :service_id, :area_id, :handling_time_id], item_images_attributes: [:id,:image_url]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item=Item.find(params[:id])
  end
end
