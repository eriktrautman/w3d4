class RemoveUrlIdColFromTags < ActiveRecord::Migration
  def up
    change_table :tags do |t|
      t.string :my_new_column
      # t.remove :url_id
    end
  end

  def down
    change_table :tags do |t|
      t.integer :url_id
    end
  end
end
