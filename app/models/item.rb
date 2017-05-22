class Item < ApplicationRecord
  belongs_to :user
  has_many :pins

  # validates_associated :user, presence: false


  def user_pin(user)
    pins.where(user: user).first
  end

end
