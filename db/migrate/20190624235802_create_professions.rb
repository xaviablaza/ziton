class CreateProfessions < ActiveRecord::Migration[5.2]
  def change
    create_table :professions do |t|
      t.string :company
      t.string :website
      t.string :title
      t.string :job_url
      t.integer :status

      t.timestamps
    end
  end
end
