class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :price
      t.string :binary

      t.timestamps
    end
  end
end
