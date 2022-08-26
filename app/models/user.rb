class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :name, presence: true
#  もはや定型文。空の場合はDBに保存しないというバリデーション

has_many :room_users
  has_many :rooms, through: :room_users

end
