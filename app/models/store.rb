class Store < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  belongs_to :category
end
