require 'spec_helper'

describe CoursesController do
  describe "GET Index" do
    it "populates an array of courses"

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET Create" do
    context "Happy route" do

    end

    context "Unhappy route" do

    end
  end
end
