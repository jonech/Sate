class AddPageLinkToEvent < ActiveRecord::Migration
  def change
    add_column :events, :page_link, :string
  end
end
