require "spec_helper"

describe WeeksController do
  describe "routing" do

    it "routes to #index" do
      get("/weeks").should route_to("weeks#index")
    end

    it "routes to #new" do
      get("/weeks/new").should route_to("weeks#new")
    end

    it "routes to #show" do
      get("/weeks/1").should route_to("weeks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weeks/1/edit").should route_to("weeks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weeks").should route_to("weeks#create")
    end

    it "routes to #update" do
      put("/weeks/1").should route_to("weeks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weeks/1").should route_to("weeks#destroy", :id => "1")
    end

  end
end
