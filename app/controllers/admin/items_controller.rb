class Admin::ItemsController < Admin::ApplicationController
  layout 'admin'
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.rank(:row_order)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_item_path(@item), notice: '商品を登録しました。'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: '商品情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_url, notice: '商品を削除しました。'
  end

  def sort
    item = Item.find(params[:item_id])
    item.update(item_params)
    render nothing: true
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :row_order_position, :image, :image_cache, :description, :active)
    end
end
