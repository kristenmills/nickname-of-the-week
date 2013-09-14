require "spec_helper"

describe SuggestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/suggestions").should route_to("suggestions#index")
    end

    it "routes to #new" do
      get("/suggestions/new").should route_to("suggestions#new")
    end

    it "routes to #show" do
      get("/suggestions/1").should route_to("suggestions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/suggestions/1/edit").should route_to("suggestions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/suggestions").should route_to("suggestions#create")
    end

    it "routes to #update" do
      put("/suggestions/1").should route_to("suggestions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/suggestions/1").should route_to("suggestions#destroy", :id => "1")
    end

  end
end
