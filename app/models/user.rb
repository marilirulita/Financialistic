class User < ApplicationRecord
  has_many :groups, class_name: "group", foreign_key: "reference_id"
end
