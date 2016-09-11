class AddRegionAndOfficeToStory < ActiveRecord::Migration
  def change
    add_column :stories, :region, :string
    add_column :stories, :office, :string
  end
end
