# == Schema Information
#
# Table name: calendars
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  link        :string(255)
#  like_count  :integer
#  is_public   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  official_id :integer
#

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
