require 'rails_helper'
describe '一覧表示機能' do
  before do
    user = FactoryBot.create(:user)
    FactoryBot.create(:micropost, content: 'テスト投稿', user: user)
  end
  context 'ユーザーがログインしているとき' do
    before do
      # ログイン画面に遷移
      visit new_user_session_path
      # 名前を入力
      fill_in 'Name', with: 'test'
      # パスワードを入力
      fill_in 'パスワード', with: 'password'
      # ログインボタンを押す
      click_button 'Log in'
    end
    it 'ユーザーが作成した投稿が表示される' do
      visit root_path
      expect(page).to have_content 'テスト投稿'
    end
  end
end
