require 'rails_helper'
RSpec.describe 'フォロー機能', type: :system do
  let(:user) { FactoryBot.create(:user, profile: 'テスト') }
  let(:michael) { FactoryBot.create(:user, name: 'michael', profile: 'こんばんは') }

  context 'フォローしていないユーザーのページを開いたとき' do
    before do
      sign_in user
      visit user_path(michael)
    end

    it 'フォローができる' do
      click_on 'フォローする'
      expect(page).to have_current_path user_path(michael), ignore_query: true
    end
  end

  context 'フォローしているユーザーのページを開いたとき' do
    before do
      sign_in user
      user.follow(michael)
      michael.follow(user)
      visit user_path(michael)
    end

    it 'フォロー解除ができる' do
      click_on 'フォロー解除する'
      expect(page).to have_current_path user_path(michael), ignore_query: true
    end

    it 'フォロー・フォロワー数がユーザーページに表示される' do
      expect(page).to have_content '1 | following'
      expect(page).to have_content '1 | followers'
    end

    it 'フォロー・フォロワー数が自分のプロフィールページに表示される' do
      visit user_profile_path(user)
      expect(page).to have_content '1 | following'
      expect(page).to have_content '1 | followers'
    end

    it 'フォロー一覧が表示される' do
      visit following_user_path(user)
      expect(user.following).not_to be_empty
      expect(page).to have_content 'Following'
      expect(page).to have_link 'michael', href: user_path(michael)
    end

    it 'フォロワー一覧が表示される' do
      visit followers_user_path(user)
      expect(user.followers).not_to be_empty
      expect(page).to have_content 'Followers'
      expect(page).to have_link 'michael', href: user_path(michael)
    end
  end
end
