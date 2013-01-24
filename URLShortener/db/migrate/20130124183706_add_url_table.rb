class AddUrlTable < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :long, :limit => 1024
      t.string :shortened
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :urls
  end
end
