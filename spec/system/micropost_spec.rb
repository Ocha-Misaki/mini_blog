require 'rails_helper'
RSpec.describe 'ユーザー', type: :system do
  let(:user) { FactoryBot.create(:user, profile: 'そろそろ眠いです') }
  let(:michael) { FactoryBot.create(:user, profile: '早起きが得意です') }

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
      fill_in 'Content', with: 'おやすみなさい'
      click_on 'Post'
      expect(page).to have_content 'おやすみなさい'
    end

    it '投稿の編集ができる' do
      micropost = FactoryBot.create(:micropost, user:, content: 'テスト')
      visit edit_user_micropost_path(micropost)
      fill_in 'Content', with: 'おはようございます'
      click_on 'Update'
      expect(page).to have_content 'おはようございます'
    end

    it '投稿の削除ができる' do
      FactoryBot.create(:micropost, user:, content: 'テスト')
      visit root_path
      click_on '削除'
      expect(page).to have_current_path root_path, ignore_query: true
    end

    it '自分の投稿とフォローしているユーザーの投稿が表示される' do
      FactoryBot.create(:micropost, user:, content: 'こんにちは', created_at: Time.current)
      FactoryBot.create(:micropost, user: michael, content: 'こんばんは', created_at: 1.week.ago)
      user.follow(michael)
      visit root_path
      # テストパスしない
      expect(find('.content')[0]).to have_content 'こんにちは'
      expect(find('.content')[1]).to have_content 'こんばんは'
      within('.micropost-list') do
        expect(page).not_to have_content 'ログアウト'
      end
    end

    it 'プロフィールの編集ができる' do
      visit user_profile_path(user)
      expect(page).to have_content 'そろそろ眠いです'
      visit edit_user_profile_path(user)
      fill_in 'Profile', with: '今日は寒い'
      click_on 'Update'
      expect(page).to have_content '今日は寒い'
    end
  end
end
