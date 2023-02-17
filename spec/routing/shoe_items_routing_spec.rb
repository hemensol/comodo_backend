require "rails_helper"

RSpec.describe ShoeItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shoe_items").to route_to("shoe_items#index")
    end

    it "routes to #show" do
      expect(get: "/shoe_items/1").to route_to("shoe_items#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shoe_items").to route_to("shoe_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shoe_items/1").to route_to("shoe_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shoe_items/1").to route_to("shoe_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shoe_items/1").to route_to("shoe_items#destroy", id: "1")
    end
  end
end
