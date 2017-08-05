require 'rails_helper'

RSpec.describe "stocked_items/edit", type: :view do
  before(:each) do
    @stocked_item = assign(:stocked_item, StockedItem.create!(
      :user => nil,
      :item => nil,
      :count => 1
    ))
  end

  it "renders the edit stocked_item form" do
    render

    assert_select "form[action=?][method=?]", stocked_item_path(@stocked_item), "post" do

      assert_select "input[name=?]", "stocked_item[user_id]"

      assert_select "input[name=?]", "stocked_item[item_id]"

      assert_select "input[name=?]", "stocked_item[count]"
    end
  end
end
