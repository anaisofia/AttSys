class AddHoursToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :hours, :integer
  end
end
