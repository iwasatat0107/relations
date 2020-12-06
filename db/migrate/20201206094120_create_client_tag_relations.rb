class CreateClientTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :client_tag_relations do |t|
      t.references :client, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
