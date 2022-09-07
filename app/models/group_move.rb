class GroupMove < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :move, dependent: :destroy
end
