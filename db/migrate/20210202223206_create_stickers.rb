class CreateStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :stickers do |t|
      t.string :image
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
