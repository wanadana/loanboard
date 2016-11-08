class Review < ApplicationRecord
  belongs_to :board
  belongs_to :user
  validates :content, length: { minimum: 5 }, presence: true
  validates :board_id, presence: true
  validates :user_id, presence: true
end
