require 'spec_helper'
  describe UsersController do

    describe "GET index" do
      it "renders user's template" do
        get :index
        expect(response.status).to eq(302)
      end
        
    end  

  end  
