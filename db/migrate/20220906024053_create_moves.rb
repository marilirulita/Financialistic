class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
    add_reference :moves, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
