class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
end
