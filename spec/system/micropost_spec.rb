require 'rails_helper'
Rspec.describe 'ユーザー' do
  before do
    let(user) { FactoryBot.create(:user, profile: 'そろそろ眠いです') }
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
      expect(page).to have_content 'そろそろ眠いです'
    end

    it '投稿の新規作成ができる' do
      visit new_user_micropost_path
      fill_in '内容', with: 'おやすみなさい'
      click_on '投稿する'
      expect(page).to have_content '投稿されました'
      expect(page).to have_content 'おやすみなさい'
    end
  end
end
