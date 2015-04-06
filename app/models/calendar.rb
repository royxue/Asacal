class Calendar < ActiveRecord::Base
  after_initialize :default

  validates :name, :description, presence: true

  has_many :events, dependent: :destroy
  belongs_to :official
  has_and_belongs_to_many :users, join_table: :users_calendars

  def default
    self.like_count ||= 0
    self.is_public ||= true
  end

end
