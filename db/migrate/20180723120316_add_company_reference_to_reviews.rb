class AddCompanyReferenceToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :company, foreign_key: true
  end
end
