class RemoveColumnStoryIdFromRelationship < ActiveRecord::Migration
  def change
  	remove_column :relationships,:story_id
  	add_column :relationships,:project_id,:integer
  end

end
