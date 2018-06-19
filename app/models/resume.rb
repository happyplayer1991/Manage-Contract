class Resume < ApplicationRecord
  mount_uploader :profile_pic,   CompanyUploader
end
