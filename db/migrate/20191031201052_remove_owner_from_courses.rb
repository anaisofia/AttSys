class RemoveOwnerFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :owner, :string
  end
end
