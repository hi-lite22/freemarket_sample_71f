class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :item,  null: false, foreign_key: true
      t.text :text,        null: false
    end
  end
end
