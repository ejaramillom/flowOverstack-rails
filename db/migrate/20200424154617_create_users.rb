class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :post, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
