FactoryBot.define do
  factory :item do
    user                    {FactoryBot.build(:user)}
    image                   {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png'))}
    name                    {'テスト'}
    explanation             {'説明文テスト'}
    category_id             {'2'}
    condition_id            {'2'}
    delivery_fee_id         {'2'}
    prefecture_id           {'2'}
    shipment_date_id        {'2'}
    price                   {'1000'}
  end
end

