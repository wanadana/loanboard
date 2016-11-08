class Availability < ApplicationRecord
  belongs_to :board
  validates :date, presence: true
  validates :timeslot, presence: true
  validates :board_id, presence: true
end
