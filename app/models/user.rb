class User < ApplicationRecord
  has_many :groups
  has_many :moves, class_name: "move", foreign_key: "author_id"
end
