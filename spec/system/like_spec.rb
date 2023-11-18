require 'rails_helper'
RSpec.describe 'いいね機能', type: :system do
  let(:user) { FactoryBot.create(:user, profile: 'テスト') }
  let(:michael) { FactoryBot.create(:user, name: 'michael', profile: 'こんばんは') }
  let(:user_micropost) { FactoryBot.create(:micropost, :user, content: 'こんにちは') }
  let(:michael_micropost) {FactoryBot.create(:micropost, user: michael, content: 'お腹すいた') }
  before do
  end

  context 'ログインしているとき' do
    before do
      sign_in user
    end

    it 'ユーザーの投稿にいいねボタンが表示される' do
      visit user_path(michael)
      expect(page).to have_content '🩷'
    end

    it '自分の投稿にはいいねボタンが表示されない' do
      visit user_profile_path
      expect(page).not_to have_content '🩷'
    end

    it 'いいねができる' do
      visit user_path(michael)
      click_on '🤍'
      expect(current_path).to eq user_path(michael)
    end

    it 'いいね解除ができる' do
      visit user_path(michael)
      click_on '🩷'
      expect(current_path).to eq user_path(michael)
    end

    it 'いいね数が自分の投稿に表示される' do
      michael.like(user_micropost)
      visit user_profile_path
      expect(page).to have_content '🩷| 1'
    end

    it 'いいね数がユーザー投稿に表示される' do
      user.like(michael_micropost)
      visit user_path(michael)
      expect(page).to have_content '🩷| 1'
    end

    it 'プロフィールページにいいねした投稿が表示される' do
      user.likes(michael_micropost)
      visit user_profile_path
      expect(page).to have_content 'いいねした一覧'
      expect(page).to have_content 'お腹すいた'
      expect(page).to have_link 'michael', href: user_path(michael)
    end

    it 'ユーザーページにいいねした投稿が表示される' do
      michael.like(user_micropost)
      expect(page).to have_content 'いいねした一覧'
      expect(page).to have_content 'こんにちは'
      expect(page).to have_link 'user', href: user_profile_path
    end
  end
end
