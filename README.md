## 課題の概要
＜サービスの概要＞
・あなたはブログに書くまでもない、日常のふとした思いつきを誰しも広くシェアできる仕組みがあればどんなに素晴らしいことだろうかと思い立ちました。
・気軽に投稿できる雰囲気を作るため、投稿文字数は極めて短く制限します。後々は画像や動画を投稿できるようにする予定ですが、まずは文字情報のみ投稿できるようにするところからはじめます。

 ## ＜課題の進め方＞
・各課題の基本要件を実装していきましょう
・各課題で指定されている技術的な要件を満たすように実装しましょう
・最低でも要件毎にコミットし、Githubでソースコードを管理するようにしましょう
・要件の裏の意図を読むことが目的ではなく、Ruby on Railsを活用してWebアプリを開発できるようになることが目的なので、基本要件の意図に迷った場合は自分で考えてサービスを設計していきましょう
・技術的に困ったことがあったらSlackでトライアウト中のみんなに相談しましょう

【注意】シークレットな情報はGithubにpushされないように気をつけましょう
参考: https://qiita.com/jqtype/items/9196e047eddb53d07a91

## ＜学習のテーマ＞
・ActiveRecordで関連を利用した処理を扱えるようになる
・Renderへのデプロイを通じてdevelopmentとproductionのビルドの違いを理解できるようになる
・Part.2とあわせて課題に取り組むことで、一般的なWebアプリ開発の一通りを体験することができる


## 課題1： 短文を投稿できるようにする
＜基本要件＞
・投稿文字数は140字に制限
・投稿内容は「全体タイムライン」に表示される
・表示する内容は以下の通り
　・投稿内容
　・投稿時間（YYYY/MM/DD hh:mm）

＜学習できる内容＞
・モデル、コントローラ、ビューの連携
・モデルへのバリデーションの記載
・Haml記法

＜技術的な要件＞
・ビューの記述にはHaml記法を使うようにしましょう（haml-rails）
・CSSテンプレートとしてbootstrapを利用するようにしましょう
　（導入方法の参考: https://qiita.com/rhistoba/items/f724dae231d7e28bf477 ）


## 課題2： ユーザー登録ができるようになり、投稿とユーザー情報が紐付くようにする
＜基本要件＞
・短文の投稿にはユーザー登録が必要
・ログインすると短文を投稿できるようになる
・ユーザー情報は以下の通り
　・ログイン情報
　　・ユーザー名（アルファベットのみ、スペース禁止、20文字以内）
　　・パスワード
　・ユーザー情報
　　・非公開情報
　　　・パスワード
　　・公開情報
　　　・ユーザー名
　　　・プロフィール（200文字以内）
　　　・ブログURL
・公開情報は各ユーザーのプロフィールページから閲覧することができる

＜学習できる内容＞
・認証処理（ユーザー登録、ログイン処理）
・ログイン状態を意識した表示制御
・モデルの関連（has_many）

＜技術的な要件＞
・ユーザーの認証には devise gem を利用すること

## 課題3： ユーザーをフォローできるようになり、自分がフォローしているユーザーの投稿のみ見られるようにする
＜基本要件＞
・タイムラインに流れる投稿から他ユーザーをフォローできる
・フォローしたユーザーのみのタイムラインが表示される

＜学習できる内容＞
・再帰的なデータ設計
・has_many throughによるデータ抽出

＜技術的な要件＞
・フォローしたユーザーのみのタイムラインを表示する際、N+1クエリにならないようにhas_many throughを活用し1回のSQLでデータ抽出を行うようにする

## 課題4： Renderにデプロイし、インターネット上からアプリケーションを利用できるようにする
＜基本要件＞
・α版として一般に公開するため、サイト全体にBasic認証を適用する
　・RAILS_ENVがproductionの場合のみサイト全体にBasic認証が適用されるようにすること
　・Basic認証に利用するユーザー名、パスワードは環境変数で管理できるようにすること（ユーザー名、パスワードを平文でGithubで管理しないようにするため）
・Renderアプリをデプロイし、ここまでの課題で作成した機能の動作を確認すること

＜学習できる内容＞
・development環境とproduction環境の違い
・Renderへのデプロイを通じたアプリケーションのインターネットへの公開方法

＜技術的な要件＞
・アプリケーションとはSSL/TLSで通信すること

