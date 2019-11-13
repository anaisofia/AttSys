class AddEncryptedPasswordToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :encrypted_password, :string
  end
end
