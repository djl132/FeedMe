class Pin < ApplicationRecord

  belongs_to :user
belongs_to :item

validates :item, presence: true, uniqueness: {scope: :user}
validates :user, presence: true, uniqueness: {scope: :item}

  include StreamRails::Activity
  as_activity

  def actor_object
    self.user
  end

  def activity_object
    self.item
  end
end



# include StreamRails::Activity and as_activity equip Pin with Stream’s functionality. Note that I do not use activity_actor because the default value (self.user) suits us perfectly. We are also leaving activity_verb to the default value of Pin.
