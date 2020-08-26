class Slot < ApplicationRecord
  belongs_to :terminal
  has_one :store, dependent: :nullify
  has_many :stores, dependent: :destroy

  delegate :name, :id, to: :terminal, prefix: :terminal

  scope :by_status_and_datetime, ->{order(is_empty: :asc, created_at: :desc)}
  scope :order_by_created_at_asc, ->{order created_at: :asc}
end
