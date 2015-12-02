class User < ActiveRecord::Base

  has_many :player1s, class_name: 'Game', foreign_key: 'player1_id'
  has_many :player2s, class_name: 'Game', foreign_key: 'player2_id'
  has_many :losers, class_name: 'Game', foreign_key: 'loser_id'

  has_secure_password
  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Only letters and numbers are allowed" },
    length: { in: 3..24 }
  validates :password, length: { minimum: 8 }, allow_nil: true

  def games
    player1s.where.not(loser: :nil) + player2s.where.not(loser: :nil)
  end

  def lost_as_first_player
    player1s.where(loser: self)
  end
end
