class Move < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_moves, dependent: :destroy
  has_many :groups, through: :group_moves

  validates :name, presence: true
  validates :amount, presence: true
end
