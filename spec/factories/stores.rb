FactoryBot.define do
  factory :store do
    name {Faker::Name.name}
    description {Faker::String.random(length: 3..100)}
    traits_for_enum :status, %w[pending approved rejected]
    image_url {Faker::String.random(length: 3..100)}
    slot_id{FactoryBot.create(:slot).id}
    user_id{FactoryBot.create(:user).id}
    category_id{FactoryBot.create(:category).id}
  end
end
