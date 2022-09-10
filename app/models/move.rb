class Move < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_moves, dependent: :destroy
  has_many :groups, through: :group_moves

  validates :name, presence: true
  validates :name, format: {without: /[1-9]/}
  validates :amount, presence: true, comparison: { greater_than: 0 }
  validates :amount, numericality: true

end
