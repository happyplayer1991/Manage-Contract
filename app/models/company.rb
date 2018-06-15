class Company < ApplicationRecord
  belongs_to :user

  validates_presence_of :title

  mount_uploader :logo,   CompanyUploader
  mount_uploader :photo0, CompanyUploader
  mount_uploader :photo1, CompanyUploader
  mount_uploader :photo2, CompanyUploader
  mount_uploader :photo3, CompanyUploader
  mount_uploader :photo4, CompanyUploader
  mount_uploader :photo5, CompanyUploader
  mount_uploader :photo6, CompanyUploader
  mount_uploader :photo7, CompanyUploader
  mount_uploader :photo8, CompanyUploader
  mount_uploader :photo9, CompanyUploader

  scope :setup_by, ->(user) { where(user_id: user.id) }
end
