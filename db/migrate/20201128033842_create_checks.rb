class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.string :title,           null: false
      t.references :user,          null: false, foreign_key: true
      t.references :client,      null: false, foreign_key: true
      t.integer :smile_id
      t.integer :aizuchi_id
      t.integer :empathy_id
      t.integer :reaction_id
      t.integer :question_id
      t.timestamps
    end
  end
end
