require 'rails_helper'

RSpec.describe "OrderedItems", type: :request do
  describe "GET /ordered_items" do
    it "works! (now write some real specs)" do
      get ordered_items_path
      expect(response).to have_http_status(200)
    end
  end
end
