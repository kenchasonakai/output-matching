class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
			t.integer :matching_post_id
      t.references :user, foreign_key: true
      t.references :followed_user, foreign_key: { to_table: :users }
      t.integer :user_post_id
      t.integer :followed_post_id

      t.timestamps

			t.index [:user_id, :followed_user_id], unique: true
    end
  end
end
