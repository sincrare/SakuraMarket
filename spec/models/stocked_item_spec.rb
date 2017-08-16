require 'rails_helper'

RSpec.describe StockedItem, type: :model do
  it '正常登録' do
    stocked_item = FactoryGirl.build(:stocked_item)
    expect(stocked_item).to be_valid
  end

  it 'userが必須であること' do
    stocked_item = FactoryGirl.build(:stocked_item)
    stocked_item.user = nil
    expect(stocked_item).not_to be_valid
  end

  it 'itemが必須であること' do
    stocked_item = FactoryGirl.build(:stocked_item)
    stocked_item.item = nil
    expect(stocked_item).not_to be_valid
  end

  it '合計金額が対象ユーザーがショッピングカートに追加している合計金額であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 5)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 10)
    expect(user.stocked_items.total_amount).to eq 300 * 5 + 500 * 10
  end

  it '合計金額が10000円以下の場合に代引き手数料が300円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 8)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 15)
    expect(user.stocked_items.cod_fee).to eq 300
  end

  it '合計金額が30000円以下の場合に代引き手数料が400円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 10)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 14)
    expect(user.stocked_items.cod_fee).to eq 400
  end

  it '合計金額が100000円以下の場合に代引き手数料が400円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 50)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 30)
    expect(user.stocked_items.cod_fee).to eq 600
  end

  it '合計金額が100000円より大きい場合に代引き手数料が400円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 100)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 140)
    expect(user.stocked_items.cod_fee).to eq 1000
  end

  it '送料は5個以下の時に600円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 2)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 2)
    expect(user.stocked_items.shipping).to eq 600
  end

  it '送料は5個以上10個未満の時に1200円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 3)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 2)
    expect(user.stocked_items.shipping).to eq 1200
  end

  it '送料は10個以上15個未満の時に1800円であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 3)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 7)
    expect(user.stocked_items.shipping).to eq 1800
  end

  it '消費税は8%で切り捨てであること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 123)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 456)
    expect(user.stocked_items.sales_tax).to eq ((123 * 300 + 456 * 500) * 0.08).floor
  end

  it '請求金額は合計金額、代引き手数料、送料、消費税の合計であること' do
    user = FactoryGirl.create(:user)
    stocked_item_300_yen = FactoryGirl.create(:stocked_item_300_yen, user: user, count: 123)
    stocked_item_500_yen = FactoryGirl.create(:stocked_item_500_yen, user: user, count: 456)
    total_amount = 123 * 300 + 456 * 500
    cod_fee = 1000
    shipping = 116 * 600
    sales_tax = (total_amount * 0.08).floor
    expect(user.stocked_items.billing_amount).to eq total_amount + cod_fee + shipping + sales_tax
  end

  it '更新時にはcountにadd_countの数を加算すること' do
    stocked_item = FactoryGirl.create(:stocked_item)
    stocked_item.add_count = 10
    stocked_item.save
    expect(stocked_item.count).to eq 11
  end

  it '送付希望日時には、3営業日から14営業日までの日付が選択肢となること' do
    Time.zone = 'Tokyo'
    Timecop.freeze(2017, 9, 11, 10, 0, 0)
    delivery_date_candidate = []
    delivery_date_candidate.push(Time.new(2017, 9, 14))
    delivery_date_candidate.push(Time.new(2017, 9, 15))
    delivery_date_candidate.push(Time.new(2017, 9, 19))
    delivery_date_candidate.push(Time.new(2017, 9, 20))
    delivery_date_candidate.push(Time.new(2017, 9, 21))
    delivery_date_candidate.push(Time.new(2017, 9, 22))
    delivery_date_candidate.push(Time.new(2017, 9, 25))
    delivery_date_candidate.push(Time.new(2017, 9, 26))
    delivery_date_candidate.push(Time.new(2017, 9, 27))
    delivery_date_candidate.push(Time.new(2017, 9, 28))
    delivery_date_candidate.push(Time.new(2017, 9, 29))
    delivery_date_candidate.push(Time.new(2017, 10, 2))
    expect(StockedItem.delivery_date_candidates).to eq delivery_date_candidate
  end
end
