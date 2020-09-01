class Store < ApplicationRecord
  STORE_PERMITTED_PARAMS = [:user_id, :slot_id, :category_id,
    :name, :description, :image_url,
    {contract_attributes: [:start_date, :end_date]}].freeze

  enum status: {pending: 1, approved: 2, rejected: 3}

  belongs_to :slot
  belongs_to :user
  belongs_to :category
  has_one :contract, dependent: :destroy

  delegate :name, :area, :price, :id, to: :slot, prefix: :slot
  delegate :name, to: :category, prefix: :category
  delegate :terminal_name, :terminal_id, to: :slot
  delegate :name, :email, :company_name, :identity_number,
           :phone_number, to: :user, prefix: :user
  accepts_nested_attributes_for :contract, allow_destroy: true

  scope :order_by_updated_at_desc, ->{order(updated_at: :desc)}

  validates :description, presence: true, allow_nil: false
  validates :name, presence: true, allow_nil: false
  validates :category_id, presence: true, allow_nil: false
end
