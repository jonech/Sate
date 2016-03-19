class AddImageUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :imageurl, :string
  end
end
