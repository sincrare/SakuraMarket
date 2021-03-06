require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  let!(:order_history) { FactoryGirl.create(:order_history) }
  it '正常登録' do
    expect(order_history).to be_valid
  end

  it 'ユーザーの住所が登録されていない時は登録できないこと' do
    order_history.user.address = nil
    expect(order_history).not_to be_valid
  end
end
