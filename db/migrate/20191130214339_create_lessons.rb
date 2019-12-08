class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :total
      t.datetime :start
      t.datetime :end
      t.references :course, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
