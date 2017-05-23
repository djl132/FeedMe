class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :item

validates :item, presence: true
validates :user, presence: true


include StreamRails::Activity
as_activity

def activity_object
  self.item
end


end
