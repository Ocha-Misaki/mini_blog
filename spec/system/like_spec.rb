require 'rails_helper'
RSpec.describe 'いいね機能', type: :system do
  let(:user) { FactoryBot.create(:user, profile: 'テスト') }
  let(:michael) { FactoryBot.create(:user, name: 'michael', profile: 'こんばんは') }
  let(:user_micropost) { FactoryBot.create(:micropost, user:, content: 'こんにちは') }
  let(:michael_micropost) { FactoryBot.create(:micropost, user: michael, content: 'お腹すいた') }

  context 'ログインしているとき' do
    before do
      sign_in user
    end

    it 'ユーザーの投稿にいいねボタンが表示される' do
      visit micropost_path(michael_micropost)
      expect(page).to have_css('[data-testid="likes_btn"]')
    end

    it '自分の投稿にはいいねボタンが表示されない' do
      visit user_profile_path
      expect(page).not_to have_css('[data-testid="likes_btn"]')
    end

    it 'いいねができる' do
      visit micropost_path(michael_micropost)
      expect { find('[data-testid="likes_btn"]').click }.to change { Like.count }.from(0).to(1)
      expect(page).to have_current_path micropost_path(michael_micropost), ignore_query: true
    end

    it 'いいね解除ができる' do
      user.likes.create!(micropost_id: michael_micropost.id)
      visit micropost_path(michael_micropost)
      expect { find('[data-testid="likes_btn"]').click }.to change { Like.count }.from(1).to(0)
      expect(page).to have_current_path micropost_path(michael_micropost), ignore_query: true
    end

    it 'いいね数が自分の投稿に表示される' do
      michael.likes.create!(micropost_id: user_micropost.id)
      visit user_micropost_path(user_micropost)
      expect(page).to have_content '1'
    end

    it 'いいね数がユーザー投稿に表示される' do
      user.likes.create!(micropost_id: michael_micropost.id)
      visit micropost_path(michael_micropost)
      expect(page).to have_content '1'
    end

    it 'プロフィールページにいいねした投稿が表示される' do
      user.likes.create!(micropost_id: michael_micropost.id)
      visit user_profile_path
      expect(page).to have_content 'いいねした投稿'
      expect(page).to have_content 'お腹すいた'
      expect(page).to have_link 'michael', href: user_path(michael)
    end

    it 'ユーザーページにいいねした投稿が表示される' do
      michael.likes.create!(micropost_id: user_micropost.id)
      visit user_path(michael)
      expect(page).to have_content 'いいねした投稿'
      expect(page).to have_content 'こんにちは'
      expect(page).to have_link 'user', href: user_path(user)
    end
  end
end
