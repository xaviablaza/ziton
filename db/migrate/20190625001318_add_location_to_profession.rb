class AddLocationToProfession < ActiveRecord::Migration[5.2]
  def change
    add_column :professions, :location, :string
  end
end
