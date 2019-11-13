class AddRememberCreatedAtToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :remember_created_at, :datetime
  end
end
