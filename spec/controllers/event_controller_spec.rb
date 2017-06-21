require 'rails_helper'

RSpec.describe EventController, type: :controller do
  describe "GET #index" do
    context "Return all the events" do
      let(:event) { create(:event) }

      before { get :index }

      it "assigns @events properly" do
        expect(assigns(:events)).to eq([event])
      end

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns a successful response" do
        expect(response).to be_success
      end
    end

    context "Return just the academic ones" do
      let(:academic_event) { create(:academic_event) }
      let(:cultural_event) { create(:cultural_event) }

      before { get :index , params: { type: 'Academic'} }

      it "returns only academic events" do
        expect(assigns(:events)).to_not eq([cultural_event])
      end
    end

    context "Return just the cultural ones" do
      let(:academic_event) { create(:academic_event) }
      let(:cultural_event) { create(:cultural_event) }

      before { get :index , params: { type: 'Cultural'} }

      it "returns only cultural events" do
        expect(assigns(:events)).to_not eq([academic_event])
      end
    end
  end

  describe "GET #show" do
    let(:event) { create(:event) }

    before { get :show, params: { id: event.id } }

    it "assigns the request to @event" do
      expect(assigns(:event)).to eq(event)
    end

    it "renders the #show view" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before { get :new }

    it "assigns to a new event" do
      expect(assigns(:event)).to be_a_new(Event)
    end

    it "renders the new view" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:event_attributes) { attributes_for(:event) }

      it "creates a new event" do
        expect{ post :create, params: { event: event_attributes}
      }.to change(Event, :count).by(1)
      end

      it "redirects to a new event path" do
        post :create, params: { event: event_attributes }
        expect(response).to redirect_to Event.last
      end
    end

    context "with invalid attributes" do
      let(:event_attributes) { attributes_for(:invalid_event) }

      it "does not save the event user" do
        expect{post :create, params: { event: event_attributes }
      }.to_not change(Event, :count)
      end

      it "re-renders the new template" do
        post :create, params: { event: event_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @event = FactoryGirl.create :event
    end

    it "deletes the event" do
      expect{ delete :destroy, params: { id: @event.id }
    }.to change(Event, :count).by(-1)
    end

    it "redirects to event#index" do
      delete :destroy, params: { id: @event.id }
      expect(response).to redirect_to event_url
    end
  end

  describe "PUT #update" do
    let!(:event) { create(:event, name: 'Alexander Pierce', contact: 'mail@email.com') }

    context "with valid attributes" do
      let(:event_attributes) { attributes_for(:event) }

      it "locates the correct event" do
        put :update, params: { id: event.id, event: event_attributes }
        expect(assigns(:event)).to eq(event)
      end

      it "changes the @event attributes" do
        put :update, params: { id: event.id,
            event: attributes_for(:event, name: 'Larry', contact:'lail@email.com') }
        event.reload
        expect(event.name).to eq("Larry")
      end

      it "redirects to the update event" do
        put :update, params: { id: event.id, event: event_attributes }
        expect(response).to redirect_to event
      end
    end

    context "with invalid attributes" do
      let(:invalid_event) { attributes_for(:invalid_event) }

      it "does not change events attributes" do
        put :update, params: { id: event.id, event: invalid_event }
        event.reload
        expect(event.name).to_not eq("Larry")
      end

      it "re-renders the edit method" do
        put :update, params: { id: event.id, event: invalid_event }
        expect(response).to render_template(:edit)
      end
    end
  end
end
