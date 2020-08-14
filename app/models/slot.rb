class Slot < ApplicationRecord
  belongs_to :terminal
  belongs_to :store
end
