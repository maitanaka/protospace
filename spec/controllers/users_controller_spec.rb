require 'rails_helper'

describe UsersController do
  context 'with user login' do
    login_user
    let(:user){build(:user)}

    describe 'GET #show' do

      before do
        get :show, id: user
      end

      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq(user)
      end

      it "renders the :show templates" do
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do

      before do
        get :edit, id: user
      end

      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq user
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do

      before do
        patch :update, id: user,
        user: attributes_for(:user, nickname: 'hoge')
      end

      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq user
      end

      it "changes @user's attributes" do
        user.reload
        expect(user.nickname).to eq 'hoge'
      end

      it "redirects root path" do
        expect(response).to redirect_to user_path
      end

      it "sends flash messages" do
        expect(flash[:notice]).to eq 'Successfully edited your account!'
      end

    end
  end


  context 'without user login' do
    let(:user){ create(:user) }

    describe 'GET #edit' do

      it "redirects sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do

      it "redirects sign_in page" do
        patch :update, id: user,
        user: attributes_for(:user, nickname: 'notvalid')
        user.reload
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
