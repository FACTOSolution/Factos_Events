require 'rails_helper'

RSpec.describe CommentController, type: :controller do
  login_user

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
