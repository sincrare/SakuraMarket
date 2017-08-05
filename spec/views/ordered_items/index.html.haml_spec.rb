require 'rails_helper'

RSpec.describe "ordered_items/index", type: :view do
  before(:each) do
    assign(:ordered_items, [
      OrderedItem.create!(
        :item => nil,
        :name => "Name",
        :price => 2,
        :image => "Image"
      ),
      OrderedItem.create!(
        :item => nil,
        :name => "Name",
        :price => 2,
        :image => "Image"
      )
    ])
  end

  it "renders a list of ordered_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
