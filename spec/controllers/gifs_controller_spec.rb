require 'rails_helper'

RSpec.describe GifsController, type: :controller do
  context 'when logged-in' do
    before(:each) do
      sign_in :user, FactoryGirl.create(:user)
    end

    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #new' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    describe 'GET #search' do
      before(:each) do
        giphy_search = double(Giphy::Search)
        expect(giphy_search).to receive(:by_title)
        expect(Giphy::Search).to receive(:new).and_return(giphy_search)
      end

      context 'xhr' do
        it 'renders search results' do
          xhr :get, :search, {gifs: {q: 'lol'}}
          expect(response).to render_template('search')
        end
      end

      context 'non xhr' do
        it 'renders search results' do
          get :search, {gifs: {q: 'lol'}}
          expect(response.status).to eq(404)
        end
      end
    end
  end

  context 'when anonymous user' do
    after(:each) do
      expect(response).to redirect_to(:new_user_session)
    end

    describe 'GET #index' do
      it 'should redirect to login page' do
        get :index
      end
    end

    describe 'GET #new' do
      it 'should redirect to login page' do
        get :new
      end
    end

    describe 'GET #search' do
      context 'non xhr' do
        it 'should redirect to login page' do
          get :search, {gifs: {q: 'lol'}}
        end
      end
    end
  end
end
