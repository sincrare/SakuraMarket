require 'rails_helper'

RSpec.describe "ordered_items/new", type: :view do
  before(:each) do
    assign(:ordered_item, OrderedItem.new(
      :item => nil,
      :name => "MyString",
      :price => 1,
      :image => "MyString"
    ))
  end

  it "renders new ordered_item form" do
    render

    assert_select "form[action=?][method=?]", ordered_items_path, "post" do

      assert_select "input[name=?]", "ordered_item[item_id]"

      assert_select "input[name=?]", "ordered_item[name]"

      assert_select "input[name=?]", "ordered_item[price]"

      assert_select "input[name=?]", "ordered_item[image]"
    end
  end
end
