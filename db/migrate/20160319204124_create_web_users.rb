class CreateWebUsers < ActiveRecord::Migration
  def change
    create_table :web_users do |t|
      t.string :name
      t.string :password_digest
      t.string :company

      t.timestamps null: false
    end
  end
end
