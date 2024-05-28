class CreateSnippets < ActiveRecord::Migration[7.0]
  def change
    create_table :snippets do |t|
      t.string :title
      t.string :code_block
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
