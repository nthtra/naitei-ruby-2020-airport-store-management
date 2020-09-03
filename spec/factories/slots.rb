FactoryBot.define do
  factory :slot do
    name {Faker::Name.name}
    area {Faker::Number.decimal(l_digits: 3)}
    is_empty {Faker::Boolean.boolean}
    description {Faker::String.random(length: 3..100)}
    price {Faker::Number.decimal(l_digits: 3)}
    terminal_id{FactoryBot.create(:terminal).id}
  end
end