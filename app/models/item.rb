class Item < ApplicationRecord
  belongs_to :user
  scope :user_login, -> (user) { where(user_id: user).order('created_at DESC') }

  def completed?
    !completed_at.blank?
  end
end
