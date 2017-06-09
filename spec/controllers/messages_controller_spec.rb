require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group)}

  describe 'GET #index' do
    context 'with login user' do
      before do
        login_user user
        get :index, params: { group_id: group.id }
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "populates an array of messages ordered by cerated_at DESC" do
        messages = create_list(:message, 3, group_id: group.id)
        expect(assigns(:messages)).to match(messages.sort{ |a, b| b.created_at <=> a.created_at })
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "populates an array of groups " do
        @groups = user.groups
        expect(assigns(:groups)).to eq @groups
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'without login user' do
      it 'requires login' do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST #create" do
    context "with login user" do
      before do
        login_user user
        post :create, params: { message: attributes_for(:message), group_id: group.id }
      end

      context "with valid attributes" do
        it "saves the new message in the database" do
         expect{
          post :create, params: { message: attributes_for(:message), group_id: group.id }
          }.to change(Message, :count).by(1)
        end

        it "redirects to message#index" do
          expect(response).to redirect_to group_messages_path
        end
      end

      context "with invalid attributes" do
        it "doesn't save the new in the database" do
          expect{
           post :create, params: { message: attributes_for(:invalid_message), group_id: group.id }
           }.not_to change(Message, :count)
        end

        it "re-renders the message#index" do
          post :create, params: { message: attributes_for(:invalid_message), group_id: group.id }
          expect(response).to render_template :index
        end
      end
    end

    context "without login user" do
      it "requires login" do
        post :create, params: { message: attributes_for(:message), group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
