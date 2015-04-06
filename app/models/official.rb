# == Schema Information
#
# Table name: officials
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  image                  :string(255)
#  link                   :string(255)
#  is_company             :boolean
#  like_count             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

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
