require "spec_helper"

describe ParkingRegistrationsController do
  describe "routing" do

    it "routes to #index" do
      get("/parking_registrations").should route_to("parking_registrations#index")
    end

    it "routes to #new" do
      get("/parking_registrations/new").should route_to("parking_registrations#new")
    end

    it "routes to #show" do
      get("/parking_registrations/1").should route_to("parking_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parking_registrations/1/edit").should route_to("parking_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parking_registrations").should route_to("parking_registrations#create")
    end

    it "routes to #update" do
      put("/parking_registrations/1").should route_to("parking_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parking_registrations/1").should route_to("parking_registrations#destroy", :id => "1")
    end

  end
end
