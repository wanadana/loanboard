class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :address, presence: true
end
