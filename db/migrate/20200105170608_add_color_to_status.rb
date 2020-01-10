class AddColorToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :color, :string
  end
end
