class Move < ApplicationRecord
  belongs_to :user, class_name: "user", foreign_key: "author_id"
  has_many :groups
end
