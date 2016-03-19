class AddWebUserToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :web_user, index: true, foreign_key: true
  end
end
