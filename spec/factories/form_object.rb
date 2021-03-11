FactoryBot.define do
  factory :form_object do
    user_id { 2 }
    item_id { 2 }
    postcode { '123-4567' }
    prefecture_id { 2 }
    town { '東村山市' }
    house_number { '1-1' }
    building_name { "マンション東京" }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

