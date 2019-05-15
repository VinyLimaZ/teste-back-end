class AddUuidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uuid, :uuid
  end
end
