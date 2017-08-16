require 'rails_helper'

RSpec.describe Item, type: :model do
  it '正常登録' do
    item = FactoryGirl.build(:item)
    expect(item).to be_valid
  end

  it 'nameが必須であること' do
    item = FactoryGirl.build(:item)
    item.name = nil
    expect(item).not_to be_valid
  end

  it 'priceが0以上の数値であること' do
    item = FactoryGirl.build(:item)
    item.price = -1
    expect(item).not_to be_valid
  end
end
