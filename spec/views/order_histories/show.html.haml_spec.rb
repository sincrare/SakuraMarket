require 'rails_helper'

RSpec.describe "order_histories/show", type: :view do
  before(:each) do
    @order_history = assign(:order_history, OrderHistory.create!(
      :user => nil,
      :shipping => 2,
      :tax => 3,
      :totalAmount => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
