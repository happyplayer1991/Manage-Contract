class Blog < ApplicationRecord
    enum status: { active: 0, non_active: 1}
end
