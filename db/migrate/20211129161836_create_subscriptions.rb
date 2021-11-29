class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :type
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
