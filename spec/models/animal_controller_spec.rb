require "rails_helper"

RSpec.describe AnimalsController, type: :controller do
	describe "GET #index" do
		
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end 

		it "loads all of the animals into @animals" do
			animal1, animal2 = Animal.create(name: "reksio"), Animal.create(name: "azor")
			get :index
			expect(assigns(:animals)).to match_array([animal1, animal2])
		end

		it 'redirects after creater animal' do
			post :create, animal: {name: "reksio"}
			expect(response).to redirect_to(animals_path)
		end
	end	
end