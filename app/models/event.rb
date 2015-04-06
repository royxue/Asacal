# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  place       :string(255)
#  is_all_day  :boolean
#  start_time  :datetime
#  end_time    :datetime
#  link        :string(255)
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  calendar_id :integer
#  like_count  :integer
#

class Event < ActiveRecord::Base
  after_initialize :default

  validates :name, :description, presence: true

  belongs_to :calendar
  has_and_belongs_to_many :users, join_table: :users_events

  def default
    self.is_all_day ||= false
    self.like_count ||= 0
    self.start_time ||= Time.now
    self.end_time ||= self.start_time + 1.hour
  end

  def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :start => self.start_time,
      :end => self.end_time,
      :description => self.description,
      :allDay => self.is_all_day,
  }
  end
end
