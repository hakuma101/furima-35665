FactoryBot.define do
  factory :item do
    product       { '商品名' }
    discription   { '商品の説明' }
    category_id   { 2 }
    condition_id  { 2 }
    cost_id       { 2 }
    prefecture_id { 2 }
    sending_id    { 2 }
    price         { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png')
    end
  end
end
