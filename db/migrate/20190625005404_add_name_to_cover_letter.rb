class AddNameToCoverLetter < ActiveRecord::Migration[5.2]
  def change
    add_column :cover_letters, :name, :string
  end
end
