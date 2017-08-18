require 'rails_helper'

RSpec.describe CommentController, type: :controller do
  login_user

  describe "GET #index" do
    context "Return all comments of one event" do
      let(:event_exem) { create(:event) }
      let(:comment) { create(:comment, event: event_exem) }

      before {get :index, params: { event_id: event_exem }}

      it "get all the comments of that event" do
        expect(assigns(:comments)).to eq([comment])
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:comment_attributes) { attributes_for(:comment) }
      let(:event_exem) { create(:event) }

      it "creates a new comment" do
        expect{ post :create, params: { event_id: event_exem, comment: comment_attributes }
      }.to change(Comment, :count).by(1)
      end
    end
  end
end
