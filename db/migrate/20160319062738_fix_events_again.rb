class FixEventsAgain < ActiveRecord::Migration
  def change
  def change
      rename_column :events, :photo_binary, :binary
  end
  end
end
