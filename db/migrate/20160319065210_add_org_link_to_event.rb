class AddOrgLinkToEvent < ActiveRecord::Migration
  def change
    add_column :events, :org_link, :string
  end
end
