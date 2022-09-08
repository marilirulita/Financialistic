class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups
  has_many :moves, class_name: 'Move', foreign_key: 'author_id'

  validates :name, presence: true
end
