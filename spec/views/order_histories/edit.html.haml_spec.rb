require 'rails_helper'

RSpec.describe "order_histories/edit", type: :view do
  before(:each) do
    @order_history = assign(:order_history, OrderHistory.create!(
      :user => nil,
      :shipping => 1,
      :tax => 1,
      :totalAmount => 1
    ))
  end

  it "renders the edit order_history form" do
    render

    assert_select "form[action=?][method=?]", order_history_path(@order_history), "post" do

      assert_select "input[name=?]", "order_history[user_id]"

      assert_select "input[name=?]", "order_history[shipping]"

      assert_select "input[name=?]", "order_history[tax]"

      assert_select "input[name=?]", "order_history[totalAmount]"
    end
  end
end
