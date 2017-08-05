require 'rails_helper'

RSpec.describe "stocked_items/index", type: :view do
  before(:each) do
    assign(:stocked_items, [
      StockedItem.create!(
        :user => nil,
        :item => nil,
        :count => 2
      ),
      StockedItem.create!(
        :user => nil,
        :item => nil,
        :count => 2
      )
    ])
  end

  it "renders a list of stocked_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
