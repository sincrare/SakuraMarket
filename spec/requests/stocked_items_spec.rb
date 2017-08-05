require 'rails_helper'

RSpec.describe "StockedItems", type: :request do
  describe "GET /stocked_items" do
    it "works! (now write some real specs)" do
      get stocked_items_path
      expect(response).to have_http_status(200)
    end
  end
end
