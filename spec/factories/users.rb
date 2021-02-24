FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'123test'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    kana_lastname         {'ヤマダ'}
    kana_firstname        {'タロウ'}
    birth_day             {'1930-01-01'}
  end
end