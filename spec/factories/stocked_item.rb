FactoryGirl.define do
  factory :stocked_item do
    association :user, factory: :user
    association :item, factory: :item
    count 1
  end

  factory :stocked_item_300_yen, class: :stocked_item do
    association :item, factory: :item_300_yen
    count 1
  end

  factory :stocked_item_500_yen, class: :stocked_item do
    association :item, factory: :item_500_yen
    count 1
  end
end
