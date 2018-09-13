class AddEmailToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string, null: false
    add_indext :users, :email
  end
end
