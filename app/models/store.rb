class Store < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  belongs_to :category
  scope :order_by_created_at_asc, ->{order(created_at: :asc)}
end
