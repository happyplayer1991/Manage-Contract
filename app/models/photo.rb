class Photo < ApplicationRecord
  belongs_to :company

  mount_uploader :source, CompanyUploader
end
