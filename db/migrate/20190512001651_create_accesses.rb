class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.uuid :uuid
      t.datetime :date_time
      t.string :path
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
