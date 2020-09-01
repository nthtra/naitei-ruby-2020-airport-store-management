FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.unique.email}
    company_name {Faker::Company.name}
    identity_number {Faker::IDNumber.brazilian_citizen_number}
    phone_number {Faker::PhoneNumber.cell_phone}
    password {Settings.validations.user.default_password}
    password_confirmation {Settings.validations.user.default_password}
  end
end
