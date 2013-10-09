class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :creator_id

      t.timestamps
    end
  end
end
