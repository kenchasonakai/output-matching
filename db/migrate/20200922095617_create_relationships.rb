class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
			t.integer :follower_post_id
			t.integer :followed_post_id
			t.integer :status, default: 0

      t.timestamps
    end
		add_index :relationships, :follower_post_id
		add_index :relationships, :followed_post_id
		add_index :relationships, :follower_id
    add_index :relationships, :followed_id
  end
end
