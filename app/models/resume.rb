class Resume < ApplicationRecord
  enum employement_eligibility: { authorized: 0, sponsorhip: 1 }

	belongs_to :user
  has_and_belongs_to_many :job_types
  has_many :work_experiences, dependent: :destroy
	accepts_nested_attributes_for :work_experiences,
																allow_destroy: true,
																reject_if: lambda { |attrs| attrs['job_title'].blank? }

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  has_many :certifications, dependent: :destroy
  accepts_nested_attributes_for :certifications,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  has_many :militaries, dependent: :destroy
  accepts_nested_attributes_for :militaries,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['rank'].blank? }

  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :awards,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  has_many :groups, dependent: :destroy
  accepts_nested_attributes_for :groups,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  has_many :patents, dependent: :destroy
  accepts_nested_attributes_for :patents,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  has_many :publications, dependent: :destroy
  accepts_nested_attributes_for :publications,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['title'].blank? }

  mount_uploader :profile_pic,   CompanyUploader
end
