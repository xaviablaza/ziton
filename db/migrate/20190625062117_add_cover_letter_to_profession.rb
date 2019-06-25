class AddCoverLetterToProfession < ActiveRecord::Migration[5.2]
  def change
    add_reference :professions, :cover_letter, foreign_key: true
  end
end
