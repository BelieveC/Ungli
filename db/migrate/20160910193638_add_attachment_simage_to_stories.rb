class AddAttachmentSimageToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :simage
    end
  end

  def self.down
    remove_attachment :stories, :simage
  end
end
