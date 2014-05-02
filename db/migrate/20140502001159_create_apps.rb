class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :price
      t.binary :file_data
      t.string :file_mime_type
      t.string :file_name

      t.timestamps
    end
  end
end
