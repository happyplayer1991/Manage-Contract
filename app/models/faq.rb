class Faq < ApplicationRecord
    enum status: { active: 1, non_active: 0}
end
