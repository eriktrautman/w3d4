class AddClicksTable < ActiveRecord::Migration
  def up
    create_table :clicks do |t|
      t.integer :url_id
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :clicks
  end
end
