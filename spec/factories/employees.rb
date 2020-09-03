FactoryBot.define do
  factory :employee do
    name {Faker::Name.name}
    email {Faker::Internet.unique.email}
    password {Settings.validations.employee.default_password}
    password_confirmation {Settings.validations.employee.default_password}
    role_id {FactoryBot.create(:role).id}
    unit_id{FactoryBot.create(:unit).id}
  end
end
