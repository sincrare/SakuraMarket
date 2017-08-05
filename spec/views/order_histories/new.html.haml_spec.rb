require 'rails_helper'

RSpec.describe "order_histories/new", type: :view do
  before(:each) do
    assign(:order_history, OrderHistory.new(
      :user => nil,
      :shipping => 1,
      :tax => 1,
      :totalAmount => 1
    ))
  end

  it "renders new order_history form" do
    render

    assert_select "form[action=?][method=?]", order_histories_path, "post" do

      assert_select "input[name=?]", "order_history[user_id]"

      assert_select "input[name=?]", "order_history[shipping]"

      assert_select "input[name=?]", "order_history[tax]"

      assert_select "input[name=?]", "order_history[totalAmount]"
    end
  end
end
