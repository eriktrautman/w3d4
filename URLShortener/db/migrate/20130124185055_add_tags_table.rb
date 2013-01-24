class AddTagsTable < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string :name
      t.integer :url_id

      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
