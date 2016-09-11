class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :supporter_id
      t.integer :story_id

      t.timestamps null: false
    end
    add_index :relationships, :supporter_id
    add_index :relationships, :story_id
  end
end
