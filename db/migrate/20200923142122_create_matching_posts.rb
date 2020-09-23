class CreateMatchingPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :matching_posts do |t|
			t.string :title, null: false
			t.string :body
			t.references :user, foringkey: true
			t.references :article
			t.integer :status, default: 0

      t.timestamps
    end
  end
end
