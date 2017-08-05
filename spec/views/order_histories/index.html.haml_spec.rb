require 'rails_helper'

RSpec.describe "order_histories/index", type: :view do
  before(:each) do
    assign(:order_histories, [
      OrderHistory.create!(
        :user => nil,
        :shipping => 2,
        :tax => 3,
        :totalAmount => 4
      ),
      OrderHistory.create!(
        :user => nil,
        :shipping => 2,
        :tax => 3,
        :totalAmount => 4
      )
    ])
  end

  it "renders a list of order_histories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
