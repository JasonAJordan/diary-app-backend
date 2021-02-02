class CreateDayStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :day_stickers do |t|
      t.belongs_to :day, null: false, foreign_key: true
      t.belongs_to :sticker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
