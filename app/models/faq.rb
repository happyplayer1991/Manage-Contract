class Faq < ApplicationRecord
    validates :question, :presence => { :message => 'cannot be blank' }
    validates :answer, :presence => { :message => 'cannot be blank' }

    enum status: { active: 1, non_active: 0}

    scope :getActiveFaqs, -> { where(status: 'active') }
end
