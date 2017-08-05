require "rails_helper"

RSpec.describe OrderedItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ordered_items").to route_to("ordered_items#index")
    end

    it "routes to #new" do
      expect(:get => "/ordered_items/new").to route_to("ordered_items#new")
    end

    it "routes to #show" do
      expect(:get => "/ordered_items/1").to route_to("ordered_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ordered_items/1/edit").to route_to("ordered_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ordered_items").to route_to("ordered_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ordered_items/1").to route_to("ordered_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ordered_items/1").to route_to("ordered_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ordered_items/1").to route_to("ordered_items#destroy", :id => "1")
    end

  end
end
