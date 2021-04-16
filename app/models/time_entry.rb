class TimeEntry < ApplicationRecord
  belongs_to :user

  validates :starts_at, presence: true
  validates :finishes_at, presence: true, if: -> { self.persisted? }
  validate :only_one_running, if: -> { self.new_record? } 

  private

  def only_one_running
    errors.add(:running, 'already running') if user&.timer_running?
  end
end
