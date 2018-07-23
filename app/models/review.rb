class Review < ApplicationRecord
  belongs_to :company
  belongs_to :user

  ratyrate_rateable "management"
end
