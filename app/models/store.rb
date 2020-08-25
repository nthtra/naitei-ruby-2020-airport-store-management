class Store < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  belongs_to :category

  delegate :name, :area, :price, to: :slot, prefix: :slot
  delegate :name, to: :category, prefix: :category
  delegate :terminal_name, :terminal_id, to: :slot
  delegate :name, :email, :company_name, :identity_number,
           :phone_number, to: :user, prefix: :user

  scope :order_by_created_at_asc, ->{order(created_at: :asc)}
end
