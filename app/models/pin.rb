class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :item

validates :item, presence: true
validates :user, presence: true


end
