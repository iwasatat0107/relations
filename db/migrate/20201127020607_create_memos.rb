class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.references :user,            null: false, foreign_key: true
      t.references :client,          null: false, foreign_key: true
      t.text :text,                  null: false
      t.timestamps
    end
  end
end
