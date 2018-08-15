class Blog < ApplicationRecord
    enum status: { active: 0, non_active: 1}

    has_many :categories, dependent: :destroy
    has_many :tags, dependent: :destroy
end
