class Official < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :default
  validates :name, :description, presence: true

  has_many :calendars, dependent: :destroy

  def default
    self.is_company ||= false
    self.like_count ||= 0
  end
end
