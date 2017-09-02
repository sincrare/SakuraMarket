require 'rails_helper'

step %(:pageページにアクセス) do |page|
  visit page
end

step %(:fieldに:valueを入力する) do |field, value|
  fill_in field, with: value
end

step %(:textと表示される) do |text|
  expect(page).to have_content(text)
end

step %(:pageページが開かれること) do |page|
  expect(current_path).to eq page
end

step %(:textボタンをクリックする) do |text|
  click_button text
end

step %(:textリンクをクリックする) do |text|
  click_link text
end

step %(:item_nameを価格:price円で登録) do |item_name, price|
  Item.create(name: item_name, price: price)
end

step %(:item_nameを:count個ショッピングカートに入れる) do |item_name, count|
  user = User.first
  item = Item.find_by_name(item_name)
  StockedItem.create(user: user, item: item, count: count)
end

step %(代引き手数料:cod_fee円、送料:shipping円、消費税:sales_tax円、合計金額:total_amount円、請求金額:billing_amount円であること) do |cod_fee, shipping, sales_tax, total_amount, billing_amount|
  user = User.first
  order_history = user.order_histories.first
  expect(order_history.cod_fee.to_s).to eq cod_fee
  expect(order_history.shipping.to_s).to eq shipping
  expect(order_history.sales_tax.to_s).to eq sales_tax
  expect(order_history.total_amount.to_s).to eq total_amount
  expect(order_history.billing_amount.to_s).to eq billing_amount
end

step 'ログインユーザーを作成する' do
  FactoryGirl.create(:user)
end

step 'ログインする' do
  user = FactoryGirl.create(:user)
  login_as(user, scope: :user)
end

step '管理者でログインする' do
  admin = FactoryGirl.create(:admin)
  login_as(admin, scope: :user)
end

step '商品を登録して商品ページを開く' do
  item = FactoryGirl.create(:item)
  visit item_path(item)
end

step %(管理者画面の:user_nameユーザーの編集画面を開く) do |user_name|
  user = User.find_by_name(user_name)
  visit edit_admin_user_path(user)
end
