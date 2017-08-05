require 'rails_helper'

RSpec.describe "stocked_items/show", type: :view do
  before(:each) do
    @stocked_item = assign(:stocked_item, StockedItem.create!(
      :user => nil,
      :item => nil,
      :count => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
