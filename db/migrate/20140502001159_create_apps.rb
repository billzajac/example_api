class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.integer :author
      t.string :price
      t.string :file_id

      t.timestamps
    end
  end
end
