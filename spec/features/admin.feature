Feature: admin
  Background:
    Given 管理者でログインする

  Scenario: 商品登録
    Given '/items/'ページにアクセス
    When '管理者画面'リンクをクリックする
    When '新規商品登録'リンクをクリックする
    When 'item_name'に'りんご'を入力する
    When 'item_price'に'150'を入力する
    When 'item_description'に'おいしいりんごです'を入力する
    When '登録する'ボタンをクリックする
    Then '商品を登録しました。'と表示される

  Scenario: 商品登録
    Given 管理者画面の'admin'ユーザーの編集画面を開く
    When 'user_name'に'管理者'を入力する
    When 'user_zip'に'1234567'を入力する
    When 'user_address'に'東京都港区芝X-XX-XX'を入力する
    When '更新する'ボタンをクリックする
    Then 'ユーザー情報を更新しました。'と表示される
