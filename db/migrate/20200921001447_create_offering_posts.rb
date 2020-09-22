class CreateOfferingPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :offering_posts do |t|
			t.string :title, null: false
      t.text :body
      t.references :user, foreign_key: true
			t.integer :status, default: 0
      t.timestamps
    end
  end
end
