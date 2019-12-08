class RemoveTotalFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :total, :integer
  end
end
