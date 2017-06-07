class ChangeColumnNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :messages, :group_id, false
    change_column_null :messages, :user_id, false
    change_column_null :group_users, :group_id, false
    change_column_null :group_users, :user_id, false
  end
end
