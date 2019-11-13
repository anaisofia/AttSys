class AddResetPasswordTokenToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :reset_password_token, :string
  end
end
