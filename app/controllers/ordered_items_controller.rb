class OrderedItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ordered_item, only: [:show, :edit, :update, :destroy]

  # GET /ordered_items
  def index
    @ordered_items = OrderedItem.all
  end

  # GET /ordered_items/1
  def show
  end

  # GET /ordered_items/new
  def new
    @ordered_item = OrderedItem.new
  end

  # GET /ordered_items/1/edit
  def edit
  end

  # POST /ordered_items
  def create
    @ordered_item = OrderedItem.new(ordered_item_params)

    if @ordered_item.save
      redirect_to @ordered_item, notice: 'Ordered item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ordered_items/1
  def update
    if @ordered_item.update(ordered_item_params)
      redirect_to @ordered_item, notice: 'Ordered item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ordered_items/1
  def destroy
    @ordered_item.destroy
    redirect_to ordered_items_url, notice: 'Ordered item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_item
      @ordered_item = OrderedItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ordered_item_params
      params.require(:ordered_item).permit(:item_id, :name, :price, :image)
    end
end
