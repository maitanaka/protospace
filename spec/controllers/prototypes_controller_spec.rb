require 'rails_helper'

describe PrototypesController do

let!(:prototype) { create(:prototype) }

   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, name: 'hogehoge')
   }}

   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, name: nil)
   }}

  context 'with user login' do
    login_user

    describe 'GET #index' do

      before do
        get :index
      end

      it 'assigns the requested prototypes to @prototypes' do
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end

    end

    describe 'GET #new' do

      before do
        get :new
      end

      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end

    end

    describe 'POST #create' do

      context 'with valid attribtues' do

        before do
          post :create, params
        end

        it 'saves the new prototype in the database' do
          expect {
            post :create, params
          }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to tell saving the prototype successfully' do
          expect(flash[:success]).to eq 'Successfully uploaded your prototype!!'
        end
      end

      context 'with invalid attribtues' do

        before do
          post :create, invalid_params
        end

        it 'does not save the new prototype in the database' do
          expect {
            post :create, invalid_params
          }.not_to change(Prototype, :count)
        end

        it 'renders the :show template' do
          expect(response).to render_template :new
        end

        it 'shows flash messages to tell saving the prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'Posted prototype unsuccessfully'
        end
      end
    end

    describe 'GET #show' do

      before do
        get :show, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do

      it 'assigns the requested contact to @prototype' do
        prototype = create(:prototype)
        get :edit, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "renders the :edit template" do
        prototype = create(:prototype, user_id: controller.current_user.id)
        get :edit, id: prototype
        expect(response).to render_template :edit
      end

    end

    describe 'PATCH #update' do

      let!(:prototype){create(:prototype)}

      context 'with valid attributes' do

        it 'assigns the requested prototype to @prototype' do
          patch :update, id: prototype, prototype: attributes_for(:prototype)
          expect(assigns(:prototype)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype = create(:prototype, name: 'hogehoge')
          patch :update, id: prototype, prototype: attributes_for(:prototype, name: "test")
          prototype.reload
          expect(prototype.name).to eq 'hogehoge'
        end

        it 'redirects to root_path'  do
          patch :update, id: prototype, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show update prototype successfully' do
          prototype = create(:prototype, user_id: controller.current_user.id)
          patch :update, id: prototype, prototype: attributes_for(:prototype)
          expect(flash[:success]).to eq "Updated your prototype"
        end
      end

      context 'with invalid attributes' do

        before do
          prototype = create(:prototype, user_id: controller.current_user.id)
          patch :update, id: prototype, prototype: attributes_for(:prototype, name: nil)
        end

        it 'does not save the new prototype' do
          prototype.reload
          expect(prototype.name).not_to eq 'hogehoge'
        end

        it 'renders the :show template' do
          expect(response).to render_template :edit
        end

        it 'shows flash message to show update prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'Failed to Update Prototype'
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:prototype){create(:prototype)}

      before do
        delete :destroy, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'deletes the prototype' do
       expect{
         prototype.destroy
       }.to change(Prototype, :count).by(-1)
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to root_path
      end

      it 'shows flash message to show delete prototype successfully' do
       prototype = create(:prototype, user_id: controller.current_user.id)
       delete :destroy, id: prototype,
       prototype: attributes_for(:prototype)
       expect(flash[:success]).to eq 'Deleted your prototype'
     end
    end
  end

  context 'without user login' do

    describe 'GET #new' do

      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'post #create' do

      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do

      it 'redirects sign_in page' do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do

      it 'redirects root_path' do
        patch :update, id: prototype, prototype: attributes_for(:prototype)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do

      it 'redirects root_path' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
