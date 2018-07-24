class Review < ApplicationRecord
  enum question1: { yes: 0, no: 1 }
  enum question3: { relaxed: 0, quick_paced: 1, stressful: 2, collaborative: 3, competitive: 4, slow_paced: 5, cut_throat: 6 }
  enum question4: { yes!: 0, no!: 1 }
  enum question5: { full_time: 0, part_time: 1, contract: 2, intern: 3, nothing: 4 }
  belongs_to :company
  belongs_to :user

  ratyrate_rateable "management"
end
