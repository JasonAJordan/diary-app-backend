class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :context
      t.string :text_color
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
