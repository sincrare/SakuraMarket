require 'rails_helper'

RSpec.describe "ordered_items/edit", type: :view do
  before(:each) do
    @ordered_item = assign(:ordered_item, OrderedItem.create!(
      :item => nil,
      :name => "MyString",
      :price => 1,
      :image => "MyString"
    ))
  end

  it "renders the edit ordered_item form" do
    render

    assert_select "form[action=?][method=?]", ordered_item_path(@ordered_item), "post" do

      assert_select "input[name=?]", "ordered_item[item_id]"

      assert_select "input[name=?]", "ordered_item[name]"

      assert_select "input[name=?]", "ordered_item[price]"

      assert_select "input[name=?]", "ordered_item[image]"
    end
  end
end
