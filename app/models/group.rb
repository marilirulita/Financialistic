class Group < ApplicationRecord
  belongs_to :user
  has_many :group_moves, dependent: :destroy
  has_many :moves, through: :group_moves

  validates :name, presence: true
  validates :icon, presence: true
end
