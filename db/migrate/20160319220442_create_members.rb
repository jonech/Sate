class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :company
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
