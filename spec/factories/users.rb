FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'123tTest'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    kana_lastname         {'ヤマダ'}
    kana_firstname        {'タロウ'}
    birth_day             {'1930-01-01'}
  end
end