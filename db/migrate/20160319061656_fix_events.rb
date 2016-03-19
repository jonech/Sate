class FixEvents < ActiveRecord::Migration
  def change
      add_column :events, :photo_filename, :string
      add_column :events, :photo_content_type, :string
      rename_column :events, :photo_binary, :binary
  end
end
