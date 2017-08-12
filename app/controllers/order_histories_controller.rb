class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_history, only: [:show, :edit, :update, :destroy]

  def index
    @order_histories = OrderHistory.all
  end

  def show
  end

  def new
    @order_history = OrderHistory.new
  end

  def edit
  end

  def create
    @order_history = current_user.order_histories.build(order_history_params)

    if @order_history.save
      current_user.stocked_items.delete_all
      redirect_to @order_history, notice: 'Order history was successfully created.'
    else
      @stocked_items = current_user.stocked_items.all
      render 'stocked_items/order_confirmation'
    end
  end

  def update
    if @order_history.update(order_history_params)
      redirect_to @order_history, notice: 'Order history was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_history.destroy
    redirect_to order_histories_url, notice: 'Order history was successfully destroyed.'
  end

  private
    def set_order_history
      @order_history = OrderHistory.find(params[:id])
    end

    def order_history_params
      p = params.require(:order_history).permit(:delivery_date, :delivery_time)
      stocked_items = current_user.stocked_items
      p[:total_amount] = stocked_items.total_amount
      p[:cod_fee] = stocked_items.cod_fee
      p[:shipping] = stocked_items.shipping
      p[:sales_tax] = stocked_items.sales_tax
      p[:billing_amount] = stocked_items.billing_amount

      ordered_items_attr = Array.new
      stocked_items.each do |stocked_item|
        ordered_item = {}
        ordered_item[:item] = stocked_item.item
        ordered_item[:name] = stocked_item.item.name
        ordered_item[:price] = stocked_item.item.price
        ordered_item[:image] = stocked_item.item.image
        ordered_item[:count] = stocked_item.count
        ordered_items_attr.push(ordered_item)
      end
      p[:ordered_items_attributes] = ordered_items_attr

      p
    end
end
