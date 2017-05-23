class Follow < ApplicationRecord

  belongs_to :user
  belongs_to :target, class_name: "User"

  validates :target_id, presence: true
  validates :user_id, presence: true


  include StreamRails::Activity
  as_activity

  def activity_object
    self.item
  end


end
