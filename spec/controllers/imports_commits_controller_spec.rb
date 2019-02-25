require 'rails_helper'

RSpec.describe ImportCommitsController, type: :controller do
  describe 'Get #new' do
    it 'render  template view new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:request) { post :create, user_name: 'Sergo8707', repository: 'tutuapp' }
    it 'it change number of commots in database' do
      expect { request }.to change(User, :count).by(1)
    end

    it 'it change number of commits in database' do
      expect { request }.to change(Commit, :count).by(88)
    end

    it 'redirect to template view Index' do
      request
      expect(response).to redirect_to import_commits_path
    end
  end
end
