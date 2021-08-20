require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe 'GET #new'do
        it "renders a new user template" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'GET #index'do
        it "renders the index template" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
        end
    end


    describe 'GET #show'do
        context "when user exists" do
            it "renders a show template" do
                user1=User.create!(username: "Capy1", password: "pw123456")
                # get :show, id: 1    
                get :show, params: {id: user1.id}
                expect(response).to render_template(:show)
            end
        end

        context "user does not exist" do 
            it "cannot render a show template" do
                begin
                    get :show, params: {id: -1}
                rescue
                    ActiveRecord:RecordNotFound
                end
                expect(response).not_to render_template(:show) 
            end

        end
    end
    
    describe 'POST #create'do
        context 'with valid params' do
            let(:user_params) do {
                    user: {
                        username: 'capy',
                        password: 'password'
                    }
                }
            end
            it 'logs in the user' do
                post :create, params: user_params

                user = User.find_by(username: 'capy')
                # expect(session[:session_token]).to eq(user.session_token)
                expect(response).to redirect_to(user_url(user))
            end

        end
        context 'with invalid params' do
            it "it renders a 'new' template" do
                post :create, params: {user: {username: 'capy', password: ''}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
    end


end
