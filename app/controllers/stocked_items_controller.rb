class StockedItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stocked_item_all, only: [:index, :order_confirmation]
  before_action :set_stocked_item, only: [:update, :destroy]

  def index
  end

  def show
  end

  def update
    if @stocked_item.update(stocked_item_params)
      redirect_to stocked_items_path, notice: 'ショッピングカートに追加しました。'
    else
      @item = Item.active.find(stocked_item_params[:item_id])
      render 'items/show'
    end
  end

  def destroy
    @stocked_item.destroy
    redirect_to stocked_items_url, notice: 'ショッピングカートから削除しました。'
  end

  def order_confirmation
    if current_user.stocked_items.blank?
      redirect_to stocked_items_url, notice: 'ショッピングカートに商品を追加してください。'
    end
  end

  private
    def set_stocked_item_all
      @stocked_items = current_user.stocked_items.all
    end

    def set_stocked_item
      @stocked_item = current_user.stocked_items.find(params[:id])
    end

    def stocked_item_params
      params.require(:stocked_item).permit(:item_id, :add_count)
    end
end
