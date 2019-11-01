class AddOwnerIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :owner_id, :string
    add_index :courses, :owner_id
  end
end
