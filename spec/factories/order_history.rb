FactoryGirl.define do
  factory :order_history do
    association :user, factory: :user
    total_amount 1000
    cod_fee 600
    shipping 300
    sales_tax 100
    billing_amount 2000
    delivery_date Date.current
    delivery_time '8,12'
  end
end
