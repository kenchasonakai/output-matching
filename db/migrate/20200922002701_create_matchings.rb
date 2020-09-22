class CreateMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :matchings do |t|
			t.references :user, foreign_key: true
			t.references :offering_post, foreign_key: true

      t.timestamps
    end
  end
end
