class Category < ApplicationRecord
    has_and_belongs_to_many :blogs

    default_scope { order(name: :ASC) }
    
    def checked?(blog)
        self.blogs.any? && (self.blogs.first.id == blog.id)
    end
end