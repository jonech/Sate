class SetupTables < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.text :description
      t.datetime :end_time
      t.string :organisation
      t.integer :like
      t.integer :lat
      t.integer :long
      t.string :imageurl
      t.datetime :start_time
      t.string :org_link
      t.string :photo_filename
      t.string :photo_content_type
      t.binary :photo_binary_data

      t.timestamps null: false
    end

    create_table :comments do |t|
      t.belongs_to :event, index:true
      t.text :text

      t.timestamps null: false
    end
  end
end
