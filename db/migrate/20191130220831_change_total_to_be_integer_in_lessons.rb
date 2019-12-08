class ChangeTotalToBeIntegerInLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :total, :integer
  end
end
