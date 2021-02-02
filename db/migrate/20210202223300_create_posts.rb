class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :context
      t.string :text_color
      t.belongs_to :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
