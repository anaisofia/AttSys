class AddOwnerToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :owner, :string
    add_index :courses, :owner
  end
end
