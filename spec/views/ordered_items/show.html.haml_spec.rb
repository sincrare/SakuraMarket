require 'rails_helper'

RSpec.describe "ordered_items/show", type: :view do
  before(:each) do
    @ordered_item = assign(:ordered_item, OrderedItem.create!(
      :item => nil,
      :name => "Name",
      :price => 2,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Image/)
  end
end
