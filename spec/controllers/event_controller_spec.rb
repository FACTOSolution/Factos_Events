require 'rails_helper'
require 'pp'

RSpec.describe EventController, type: :controller do
  login_user

  describe "POST #order" do
    context "Return all the events" do
      let(:event) { create(:cultural_published_event) }

      before { post :order }

      it "assigns @events properly" do
        expect(assigns(:events)).to eq([event])
      end

      it "renders the index view" do
        expect(response).to render_template(:order)
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
        expect(assigns(:events)).to eq([cultural_event])
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

  describe "POST #create" do
    context "with valid attributes" do
      let(:user) { create(:user)}
      let(:event_attributes) { attributes_for(:academic_published_event, user: user).merge({ user_id: user.id }) }

      it "creates a new event" do
        expect{ post :create, params: { event: event_attributes }
      }.to change(Event, :count).by(1)
      end

      it "redirects to a new event path" do
        post :create, params: { event: event_attributes }
        expect(response).to redirect_to event_path(Event.last)
      end
    end

    context "with invalid attributes" do
      let(:event_attributes) { attributes_for(:invalid_event) }

      it "does not save the event" do
        expect{post :create, params: { event: event_attributes }
      }.to_not change(Event, :count)
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

    end
  end

  describe "POST #search" do
    context "With a valid query" do
      let(:events) { create_list(:event, 25) }

      it "returns the event by name" do
        post :search, params: { name: events.last.name }
        expect(assigns(:events)).to eq([Event.last])
      end

      it "retuns the event by user_id" do
        post :search, params: { user_id: events.last.user_id }
        expect(assigns(:events)).to eq([Event.last])
      end
    end

    context "With a invalid query" do
      let(:events) { create_list(:event, 25) }

      it "Not return any event" do
        post :search, params: { cover: events.last.user_id }
        expect(assigns(:events)).to_not eq([Event.last])
      end
    end
  end

  describe "GET #publish" do
    context "With a unpublished event" do
      let(:events) { create_list(:event, 2) }

      it "turn the publish to true" do
        get :publish, format: :json,params: { event_id: events[0].id }
        events[0].reload
        expect(events[0].published).to eq(true)
      end

      it "set the event_status to approved" do
        get :publish, format: :json, params: { event_id: events[1].id }
        events[1].reload
        expect(events[1].event_status).to eq("approved")
      end
    end
  end

  describe "GET #reject" do
    context "with a unpublished event" do
      let(:events) { create_list(:event, 2) }

      it "turn the publish to true" do
        get :reject, format: :json,params: { event_id: events[0].id }
        events[0].reload
        expect(events[0].published).to eq(false)
      end

      it "set the event_status to approved" do
        get :reject, format: :json, params: { event_id: events[1].id }
        events[1].reload
        expect(events[1].event_status).to eq("rejected")
      end
    end
  end
end
