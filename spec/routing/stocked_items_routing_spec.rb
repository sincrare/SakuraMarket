require "rails_helper"

RSpec.describe StockedItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stocked_items").to route_to("stocked_items#index")
    end

    it "routes to #new" do
      expect(:get => "/stocked_items/new").to route_to("stocked_items#new")
    end

    it "routes to #show" do
      expect(:get => "/stocked_items/1").to route_to("stocked_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stocked_items/1/edit").to route_to("stocked_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stocked_items").to route_to("stocked_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stocked_items/1").to route_to("stocked_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stocked_items/1").to route_to("stocked_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stocked_items/1").to route_to("stocked_items#destroy", :id => "1")
    end

  end
end
