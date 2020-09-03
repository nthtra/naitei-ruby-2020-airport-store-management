FactoryBot.define do
  factory :terminal do
    name {Faker::Name.name}
    area {Faker::Number.decimal(l_digits: 3)}
    description {Faker::String.random(length: 3..100)}
    employee_id{FactoryBot.create(:employee).id}
  end
end