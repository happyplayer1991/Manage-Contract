class AddInterfaceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interface, :integer, default: 1
  end
end
