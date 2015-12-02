class AddLoserToGames < ActiveRecord::Migration
  def change
    add_reference :games, :loser, index: true, references: :users
  end
end
