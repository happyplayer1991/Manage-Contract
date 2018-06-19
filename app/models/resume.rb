class Resume < ApplicationRecord
	belongs_to :user
	has_many :work_experiences, dependent: :destroy
	accepts_nested_attributes_for :work_experiences,
																allow_destroy: true,
																reject_if: lambda { |attrs| attrs['job_title'].blank? }

  mount_uploader :profile_pic,   CompanyUploader
end
