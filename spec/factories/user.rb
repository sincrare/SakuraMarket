FactoryGirl.define do
  factory :user do
    name 'user'
    email 'user@sample.com'
    password 'user_password'
    is_admin false
    zip '1234567'
    address '東京都港区1-2-3'
  end

  factory :admin_user, class: :user do
    name 'admin'
    email 'admin@sample.com'
    password 'admin_password'
    is_admin true
  end
end
