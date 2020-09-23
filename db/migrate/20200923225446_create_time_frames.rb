class CreateTimeFrames < ActiveRecord::Migration[6.0]
  def change
    create_table :time_frames do |t|
			t.datetime :time_frame
			t.references :user
			t.references :matching_post

      t.timestamps
    end
  end
end
