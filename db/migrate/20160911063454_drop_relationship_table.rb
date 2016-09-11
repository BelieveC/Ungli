class DropRelationshipTable < ActiveRecord::Migration
  def changes
  	drop_table :relationships
  end
end
