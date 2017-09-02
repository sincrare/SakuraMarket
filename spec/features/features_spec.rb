require 'rails_helper'

feature 'ユーザー新規登録', type: :featrue do
  it 'ユーザーを新規登録する' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'user@sample.com'
    fill_in 'user_name', with: '山田 太郎'
    fill_in 'user_password', with: 'user_password'
    fill_in 'user_password_confirmation', with: 'user_password'
    click_button '新規登録'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end
end

feature 'ユーザーログイン・ログアウト', type: :featrue do
  before do
    @user = FactoryGirl.create(:user)
  end
  it 'ログインする' do
    visit new_user_session_path
    fill_in 'user_email', with: 'user@sample.com'
    fill_in 'user_password', with: 'user_password'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end
  it 'ログアウトする' do
    login_as(@user, scope: :user)
    visit items_path
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end

feature 'ショッピングカートに追加する', type: :featrue do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
    @item = FactoryGirl.create(:item)
  end
  it 'ショッピングカートに追加する' do
    visit item_path(@item)
    fill_in 'stocked_item_add_count', with: '5'
    click_button 'ショッピングカートに追加する'
    expect(page).to have_content 'ショッピングカートに追加しました。'
  end
end
