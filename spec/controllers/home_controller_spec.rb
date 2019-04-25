require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	describe "GET index" do
		it "renders the index template" do
		  get :index
		  expect(response).to render_template("index")
		end
		
		it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end		
	end

	describe "POST create" do
		it "renders the create js template" do
		  post :create, params: {currency: {base_currency: 'INR', start_at: Date.today - 2.days, end_at: Date.today}}, format: 'js'
		  expect(response.content_type).to eq "text/javascript"
		end

		it "has a 200 status code" do
      post :create, params: {currency: {base_currency: 'INR', start_at: Date.today - 2.days, end_at: Date.today}}, format: 'js'
      expect(response.status).to eq(200)
    end
	end
end
