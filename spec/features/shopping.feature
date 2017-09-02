Feature: shopping
  Background:
    Given ログインする

  Scenario: 商品をショッピングカートに追加して購入する
    Given 商品を登録して商品ページを開く
    When 'stocked_item_add_count'に'5'を入力する
    When 'ショッピングカートに追加する'ボタンをクリックする
    Then 'ショッピングカートに追加しました。'と表示される
    When '注文確認に進む'リンクをクリックする
    Then '/stocked_items/order_confirmation'ページが開かれること
    When '注文を確定する'ボタンをクリックする
    Then '注文を受付けました。'と表示される

  Scenario: 請求金額の計算確認
    When 'りんご'を価格'150'円で登録
    When 'みかん'を価格'90'円で登録
    When '桃'を価格'330'円で登録
    When 'りんご'を'10'個ショッピングカートに入れる
    When 'みかん'を'18'個ショッピングカートに入れる
    When '桃'を'6'個ショッピングカートに入れる
    When '/stocked_items/order_confirmation/'ページにアクセス
    When '注文を確定する'ボタンをクリックする
    Then 代引き手数料'300'円、送料'4200'円、消費税'768'円、合計金額'5100'円、請求金額'10368'円であること

