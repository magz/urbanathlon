require "spec_helper"

describe WorkoutTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/workout_tags").should route_to("workout_tags#index")
    end

    it "routes to #new" do
      get("/workout_tags/new").should route_to("workout_tags#new")
    end

    it "routes to #show" do
      get("/workout_tags/1").should route_to("workout_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workout_tags/1/edit").should route_to("workout_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workout_tags").should route_to("workout_tags#create")
    end

    it "routes to #update" do
      put("/workout_tags/1").should route_to("workout_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workout_tags/1").should route_to("workout_tags#destroy", :id => "1")
    end

  end
end
