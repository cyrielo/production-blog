class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :author
      t.integer :tags, array: true, default: []

      t.timestamps
    end
  end
end
