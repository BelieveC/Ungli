class AddPrivacyIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :privacy_id, :integer
  end
end
