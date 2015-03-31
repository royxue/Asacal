class Calendar < ActiveRecord::Base
  after_initialize :default

  validates :name, :description, presence: true

  has_many :events
  belongs_to :official

  def default
    self.like_count ||= 0
    self.is_public ||= true

end
