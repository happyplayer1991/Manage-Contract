class Blog < ApplicationRecord
    default_scope { order(published_at: 'DESC') }
    validates :title, :presence => { :message => 'cannot be blank' }
    validates :content, :presence => { :message => 'cannot be blank' }

    enum status: { active: 1, non_active: 0}

    has_and_belongs_to_many :categories
    has_and_belongs_to_many :tags

    #image upload
    mount_uploader :featured_image, ImageUploader
end
