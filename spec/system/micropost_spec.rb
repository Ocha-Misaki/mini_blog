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

    it '投稿の編集ができる' do
      micropost = FactoryBot.create(:micropost, user:, content: 'テスト')
      visit edit_user_micropost_path(micropost)
      fill_in 'Content', with: 'おはようございます'
      click_on 'update'
      expect(page).to have_content 'おはようございます'
    end

    it '投稿の削除ができる' do
      FactoryBot.create(:micropost, user:, content: 'テスト')
      visit root_path
      click_on '削除'
      expect(current_path).to eq root_path
    end

    it '自分の投稿とフォローしているユーザーの投稿が表示される' do
      #自分の投稿が表示される場合
      #フォローしているユーザーの投稿が表示される場合
      #フォローしていないユーザーの投稿は表示されない場合
    end

    it 'プロフィールの編集ができる' do
      visit edit_user_profile_path(user)
      fill_in 'Profile', with: '今日は寒い'
      click_on 'Update'
      expect(page).to have_content '今日は寒い'
    end
  end
end

RSpec.describe 'フォロー機能' do
  let(:user) { FactoryBot.create(:user, profile: 'テスト') }
  let(:other) { FactoryBot.create(:other, profile: 'こんばんは') }
  before do
  end

  context 'ログインしているとき' do
    before do
      sign_in user
    end

    it 'フォローができる' do
      expect(user.following?(other)).to_not be_truthy
      user.follow(other)
      expect(user.following?(other)).to be_truthy
    end

    it 'フォロー解除ができる' do
      user.follow(other)
      expect(user.following?(other)).to_not be_falsey
      user.unfollow(other)
      expect(user.following?(other)).to be_falsey
    end

    it 'フォロー・フォロワー数がユーザーページに表示される' do
      user = FactoryBot.send(:create_relationships)
      visit user_path(user)
      expect(page).to have_content '10 following'
      expect(page).to have_content '10 followers'
    end

    it 'フォロー・フォロワー数が自分のプロフィールページに表示される' do
      user = FactoryBot.send(:create_relationships)
      visit user_profile_path(user)
      expect(page).to have_content '10 following'
      expect(page).to have_content '10 followers'
    end

    it 'フォロー一覧が表示される' do
      user = FactoryBot.send(:create_relationships)
      visit following_user_path(user)
      expect(user.following).to_not be_empty
      expect(page).to have_content 'Following'
      user.following.each do |user|
        expect(page).to have_link user.name, href: user_path(user)
      end
    end

    it 'フォロワー一覧が表示される' do
      user = FactoryBot.send(:create_relationships)
      visit followers_user_path(user)
      expect(user.followers).to_not be_empty
      expect(page).to have_content 'Followers'
      user.followers.each do |user|
        expect(page).to have_link user.name, href: user_path(user)
      end
    end
  end
end
