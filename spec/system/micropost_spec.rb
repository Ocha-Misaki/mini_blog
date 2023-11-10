require 'rails_helper'
describe '一覧表示機能' do
  before do
    user_a = FactoryBot.create(:user)
    FactoryBot.create(:micropost, content: '最初のタスク', user: user_a)
  end
  context 'ユーザーAがログインしているとき' do
    before do
      # ユーザーAでログイン
      # ログイン画面に遷移
      # メールアドレスを入力
      # パスワードを入力
      # ログインボタンを押す
    end
    it 'ユーザーAが作成したタスクが表示される' do
      visit root_path
      expect(page).to have_content 'ミニブログへようこそ'
    end
  end
end
