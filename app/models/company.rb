class Company < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reviews
  accepts_nested_attributes_for :photos,
                          allow_destroy: true,
                          reject_if: lambda { |attrs| attrs['source'].blank? }

  validates_presence_of :title

  mount_uploader :logo,   CompanyUploader

  scope :setup_by, ->(user) { where(user_id: user.id) }


  after_commit :reindex_jobs

  def reindex_jobs
    user.jobs&.reindex
  end
end
