class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name

      t.timestamps
    end
    add_reference :posts, :user, foreign_key: true
    add_reference :comments, :user, foreign_key: true
    add_reference :answers, :user, foreign_key: true

  end
end
