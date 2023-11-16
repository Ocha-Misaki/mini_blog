require 'rails_helper'
RSpec.describe 'ユーザー' do
  let(:user) { FactoryBot.create(:user, profile: 'テスト') }
  before do
  end

  context 'ログインしているとき' do
    before do
      sign_in user
    end

    it 'プロフィールリンクが表示される' do
      # サインイン状態
      visit root_path
      expect(page).to have_content 'プロフィール'
    end

    it 'プロフィールが閲覧できる' do
      visit user_profile_path
      expect(page).to have_content 'テスト'
    end

    it '投稿の新規作成ができる' do
      visit new_user_micropost_path
      fill_in 'Content', with: 'おやすみなさい'
      click_on 'Post'
      expect(page).to have_content 'おやすみなさい'
    end
  end

  
end
