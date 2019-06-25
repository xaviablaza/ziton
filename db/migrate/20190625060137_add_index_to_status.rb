class AddIndexToStatus < ActiveRecord::Migration[5.2]
  def change
    add_index :professions, :status
  end
end
