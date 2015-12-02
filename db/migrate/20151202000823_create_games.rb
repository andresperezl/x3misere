class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :board1, array: true, default: [0,0,0,0,0,0,0,0,0]
      t.integer :board2, array: true, default: [0,0,0,0,0,0,0,0,0]
      t.integer :board3, array: true, default: [0,0,0,0,0,0,0,0,0]
      t.timestamps null: false
    end

    add_reference :games, :player1, references: :users, index: true
    add_reference :games, :player2, references: :users, index: true

  end
end
