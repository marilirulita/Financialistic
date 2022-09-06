class Move < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :groups
  validates :name, presence: true
  validates :amount, presence: true
end
