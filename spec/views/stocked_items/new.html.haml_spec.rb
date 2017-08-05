require 'rails_helper'

RSpec.describe "stocked_items/new", type: :view do
  before(:each) do
    assign(:stocked_item, StockedItem.new(
      :user => nil,
      :item => nil,
      :count => 1
    ))
  end

  it "renders new stocked_item form" do
    render

    assert_select "form[action=?][method=?]", stocked_items_path, "post" do

      assert_select "input[name=?]", "stocked_item[user_id]"

      assert_select "input[name=?]", "stocked_item[item_id]"

      assert_select "input[name=?]", "stocked_item[count]"
    end
  end
end
