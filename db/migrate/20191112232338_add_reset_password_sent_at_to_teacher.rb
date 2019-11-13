class AddResetPasswordSentAtToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :reset_password_sent_at, :datetime
  end
end
