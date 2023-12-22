class AddUserTypeToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :user_type, :integer
  end
end
