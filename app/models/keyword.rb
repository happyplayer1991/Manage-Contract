class Keyword < ApplicationRecord
  belongs_to :user

  scope :set_by, ->(user) { where(user_id: user.id) }
end
