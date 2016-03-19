class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.text :description
      t.datetime :end_time
      t.string :organisation
      t.integer :like
      t.binary :cover_photo

      t.timestamps null: false
    end
  end
end
