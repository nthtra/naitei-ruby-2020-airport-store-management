class Slot < ApplicationRecord
  belongs_to :terminal
  has_many :stores, dependent: :destroy

  delegate :name, :id, to: :terminal, prefix: :terminal

  scope :by_status_and_datetime, ->{order(is_empty: :asc, created_at: :desc)}
end
