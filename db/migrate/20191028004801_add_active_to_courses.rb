class AddActiveToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :active, :boolean
  end
end
