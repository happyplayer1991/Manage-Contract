class Skill < ApplicationRecord
  belongs_to :resume

  after_commit :reindex_resume

  def reindex_resume
    resume.reindex
  end
end
