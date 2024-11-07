class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :timezone

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  def self.find_overlapping_availabilities(user1_id, user2_id)
    Availability
      .where(user_id: user1_id)
      .joins("INNER JOIN availabilities AS other_avail ON other_avail.user_id = #{user2_id}")
      .where("availabilities.start_time < other_avail.end_time AND availabilities.end_time > other_avail.start_time")
      .select(
        "CASE WHEN availabilities.start_time > other_avail.start_time THEN availabilities.start_time ELSE other_avail.start_time END AS start_time",
        "CASE WHEN availabilities.end_time < other_avail.end_time THEN availabilities.end_time ELSE other_avail.end_time END AS end_time"
      )
      .map { |avail| { start_time: avail.start_time, end_time: avail.end_time } }
  end

  def self.find_available_slot(user, start_time, end_time)
    user.availabilities.where("start_time < ? AND end_time > ?", end_time, start_time).first
  end

  def consume_duration(start_time, end_time)
    if self.start_time < start_time && self.end_time > end_time
      # case of booking in middle of the availability
      remaining_start = self.dup
      remaining_start.end_time = start_time
      remaining_start.save!

      remaining_end = self.dup
      remaining_end.start_time = end_time
      remaining_end.save!

      self.destroy
    elsif self.start_time >= start_time && self.end_time <= end_time
      # The entire availability is consumed, no need to split
      self.destroy
    else
      # Partial overlap, adjust the start_time or end_time accordingly
      if self.start_time < start_time
        self.update!(end_time: start_time)
      else
        self.update!(start_time: end_time)
      end
    end
  end

  def end_time_after_start_time
    errors.add(:end_time, "must be after start time") if end_time <= start_time
  end
end
