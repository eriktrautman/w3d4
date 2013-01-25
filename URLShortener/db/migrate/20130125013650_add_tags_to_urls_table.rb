class AddTagsToUrlsTable < ActiveRecord::Migration
  def up
    create_table :tags_to_urls do |t|
      t.integer :url_id
      t.integer :tag_id

      t.timestamps
    end
  end
  def down
    drop_table :tags_to_urls
  end
end
