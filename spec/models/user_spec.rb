require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryGirl.build(:user) }
  it '正常登録' do
    expect(user).to be_valid
  end

  it '管理者ユーザーの時はadmin?でチェックできること' do
    user = FactoryGirl.build(:admin)
    expect(user.admin?).to eq true
  end

  it 'パスワードなしでユーザー情報を更新できること' do
    params = { name: 'update_user' }
    user.update_without_current_password(params)
    expect(user.name).to eq 'update_user'
  end

  it 'パスワードなしでユーザーのパスワードを更新できること' do
    params = { password: 'update_password' }
    user.update_without_current_password(params)
    expect(user.password).to eq 'update_password'
  end
end
