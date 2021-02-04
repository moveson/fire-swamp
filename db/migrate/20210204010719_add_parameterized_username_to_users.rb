class AddParameterizedUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :parameterized_username, :string
  end
end
