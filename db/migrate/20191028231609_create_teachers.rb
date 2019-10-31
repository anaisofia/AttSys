class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.numeric :phone
      t.text :summary
      t.date :birthdate
      t.string :nationality
      t.boolean :active

      t.timestamps
    end
  end
end
