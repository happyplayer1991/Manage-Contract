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

  COMPANIES_PER_PAGE = 10
  paginates_per COMPANIES_PER_PAGE

  include CompanySearch

  after_commit :reindex_jobs

  def reindex_jobs
    user.jobs&.reindex
  end

  def avg_rating
    return 0 if reviews.blank?
    reviews.average(:average).round(2)
  end
end
