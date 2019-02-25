require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe 'PATCH #update' do
    context 'User is trying to update user_name' do
      it 'assigns the requested user to @user' do
        patch :update, id: user, user: attributes_for(:user), format: :json
        expect(assigns(:user)).to eq user
      end

      it 'change user_name' do
        patch :update,  id: user, user: { name: 'NewName' }, format: :json
        user.reload
        expect(user.name).to eq 'NewName'
      end
    end
  end
end
