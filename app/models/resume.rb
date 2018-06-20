class Resume < ApplicationRecord
  enum employement_eligibility: { authorized: 0, sponsorhip: 1 }

	belongs_to :user
  has_and_belongs_to_many :job_types
	has_many :work_experiences, dependent: :destroy
	accepts_nested_attributes_for :work_experiences,
																allow_destroy: true,
																reject_if: lambda { |attrs| attrs['job_title'].blank? }

  mount_uploader :profile_pic,   CompanyUploader
end
