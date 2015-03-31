class Event < ActiveRecord::Base
  after_initialize :default

  validates :name, :description, presence: true

  belongs_to :calendar

  def default
    self.is_all_day ||= false
    self.start_time ||= Time.now
    self.end_time ||= self.start_time + 1.hour
end
