FactoryGirl.define do
  factory :item do
    name 'みかん'
    price 150
  end

  factory :item_300_yen, class: :item do
    name '桃'
    price 300
  end

  factory :item_500_yen, class: :item do
    name 'メロン'
    price 500 
  end
end
