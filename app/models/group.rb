class Group < ApplicationRecord
  belongs_to :user
  has_many :group_moves, dependent: :destroy
  has_many :moves, through: :group_moves

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    moves = group_moves.includes([:move])
    total = 0
    moves.each do |move|
      total += move.move.amount
    end
    total
  end
end
