class Group < ApplicationRecord
  belongs_to :user
  has_many :moves
  
  validates :name, presence: true
  validates :icon, presence: true
end
