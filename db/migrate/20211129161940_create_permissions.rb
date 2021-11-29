class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.integer :entity
      t.integer :role
      t.boolean :read
      t.boolean :write
      t.boolean :delete

      t.timestamps
    end
  end
end
