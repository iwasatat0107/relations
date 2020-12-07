class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :last_name,           null: false
      t.string :first_name
      t.string :last_name_kana,      null: false
      t.string :first_name_kana
      t.string :company
      t.integer :prefecture_id
      t.date :birthday
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
