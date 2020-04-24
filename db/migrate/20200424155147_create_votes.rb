class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, null: false
      t.text :text

      t.timestamps
    end
  end
end
