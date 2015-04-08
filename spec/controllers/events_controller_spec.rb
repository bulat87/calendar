require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

before :each do
  @user = FactoryGirl.create(:user)
  @event = FactoryGirl.create(:event)
  sign_in @user
end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "render show template if an event is found" do
      get :show, id: @event.id
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new event to database" do 
        expect{
          post :create, event: attributes_for(:event)
        }.to change(Event,:count).by(1)
      end

      it "redirects to the home page" do
        post :create, event: attributes_for(:event)
        expect(response).to redirect_to "/"
      end
    end

    context "with invalid attributes" do
      it "does not save new event to database" do
        expect{
          post :create, event: attributes_for(:event, title: nil)
        }.to_not change(Event,:count)
      end
      it "re-renders the :new template" do
        post :create, event: attributes_for(:event, recurrence: nil)
        expect(response).to render_template :new
      end
    end

    context "user is not logged in" do
      it "does not save new event to database if user is signed out" do
        sign_out @user
        expect{
          post :create, event: attributes_for(:event)
        }.to_not change(Event,:count)
      end
    end
  end

  describe "PUT #update" do
    let(:attr) do 
      { :title => 'new title' }
    end

    before(:each) do
      put :update, :id => @event.id, :event => attr
      @event.reload
    end

    context "with valid attributes" do
      it "redirects to the event page" do
        expect(response).to redirect_to(@event)
      end
      it "save the right event attr" do
        expect(@event.title).to eql attr[:title]
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the event" do
      expect{ 
        delete :destroy, :id => @event.id
      }.to change(Event, :count).by(-1)
    end
  end
end
