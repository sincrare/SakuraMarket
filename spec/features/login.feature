Feature: login
  Scenario: 新規ユーザー作成
    Given '/users/sign_up/'ページにアクセス
    When 'user_email'に'user@sample.com'を入力する
    When 'user_name'に'山田 太郎'を入力する
    When 'user_password'に'user_password'を入力する
    When 'user_password_confirmation'に'user_password'を入力する
    When '新規登録'ボタンをクリックする
    Then 'アカウント登録が完了しました。'と表示される

  Scenario: ログインする
    Given ログインユーザーを作成する
    Given '/users/sign_in/'ページにアクセス
    When 'user_email'に'user@sample.com'を入力する
    When 'user_password'に'user_password'を入力する
    When 'ログイン'ボタンをクリックする
    Then 'ログインしました。'と表示される

  Scenario: ログアウトする
    Given ログインする
    Given '/items/'ページにアクセス
    When 'ログアウト'リンクをクリックする
    Then 'ログアウトしました。'と表示される

