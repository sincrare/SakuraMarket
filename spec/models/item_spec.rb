require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) { FactoryGirl.build(:item) }
  it '正常登録' do
    expect(item).to be_valid
  end

  it 'nameが必須であること' do
    item.name = nil
    expect(item).not_to be_valid
  end

  it 'priceが0以上の数値であること' do
    item.price = -1
    expect(item).not_to be_valid
  end
end
