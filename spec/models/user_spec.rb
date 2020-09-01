require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user_true) {FactoryBot.build :user}
  let!(:user_fail) {FactoryBot.build :user, name: nil}

  describe "Associations" do
    it "should has many stores" do
      is_expected.to have_many(:stores).dependent(:nullify)
    end
  end

  describe "Validations" do
    context "validates password" do
      it "should has secure password" do
        should have_secure_password
      end
      it "should has secure password" do
        should validate_length_of(:password)
      end
    end

    context "validates identity number" do
      it "should be identity number" do
        subject { FactoryBot.create :user}
        should validate_length_of(:identity_number)
      end
    end

    context "validates company name" do
      it "should be company name" do
        subject { FactoryBot.create :user}
        should validate_length_of(:company_name)
      end
    end
  end
end
