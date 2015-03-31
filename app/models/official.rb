class Official < ActiveRecord::Base
  after_initialize :default
  validates :name, :description, presence: true

  has_many :calendars

  def default
    self.is_company ||= false
    self.like_count ||= 0
end
