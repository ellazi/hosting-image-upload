class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many  :posts, dependent: :destroy
  has_many  :apartments, dependent: :destroy
  has_many :appointmets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
