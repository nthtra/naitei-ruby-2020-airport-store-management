FactoryBot.define do
  factory :employee do
    name {Faker::Name.name}
    email {Faker::Internet.unique.email}
    password {Settings.validations.employee.default_password}
    password_confirmation {Settings.validations.employee.default_password}
    unit_id {Settings.validations.employee.default_unit_id}
    role_id {Settings.validations.employee.default_role_id}
  end
end
