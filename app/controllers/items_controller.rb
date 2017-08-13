class ItemsController < ApplicationController
  def index
    @items = Item.active.rank(:row_order)
  end

  def show
    @item = Item.active.find(params[:id])
  end
end
