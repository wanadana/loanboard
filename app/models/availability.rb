class Availability < ApplicationRecord
  belongs_to :board
  validates :date, presence: true
  # validates :timeslot, presence: true
  validates :board_id, presence: true

  scope :available, -> { where(booked_by: nil) }
  scope :booked, -> {where.not(booked_by: nil) }

  def make_booking
    booked_by = user.id
    booked_on = Time.now
    self.save
  end

  def cancel_booking
    booked_by = nil
    booked_on = nil
    self.save
  end

  def available?
    booked_by == nil
  end


end
