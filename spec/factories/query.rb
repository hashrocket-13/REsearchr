FactoryGirl.define do
  factory :query do
    title "sales"
    q_string "http://streeteasy.com/nyc/api/sales/data?criteria=zip:10023%7Cbeds:1%7Cbaths:1&key=639ac73e9907562d8bb933b31b312eb0e7f92ecc&format=json"
    association :user
  end
end