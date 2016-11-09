class Board < ApplicationRecord
  CATEGORIES = ["Longboard","Penny Board","Skateboard"]

  belongs_to :user
  has_many :bookings, through: :availabilities
  has_many :reviews, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  validates :description, presence: true
  validates :price, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }, presence: true
  mount_uploader :photo, PhotoUploader
end
