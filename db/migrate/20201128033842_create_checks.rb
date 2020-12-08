class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.string :title,           null: false
      t.references :user,        null: false, foreign_key: true
      t.references :client,      null: false, foreign_key: true
      t.integer :smile_id,       null: false
      t.integer :aizuchi_id,     null: false
      t.integer :empathy_id,     null: false
      t.integer :reaction_id,    null: false
      t.integer :question_id,    null: false
      t.timestamps
    end
  end
end
