# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  network_affiliation    :string
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  yes_participating      :boolean
#  phone_number           :string
#  full_daytime_address   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :meetings1, :class_name => "Meeting", :foreign_key => "first_participant"
  has_many :meetings2, :class_name => "Meeting", :foreign_key => "second_participant"
  has_many :participant2s, :through => :meetings1, :source => :participant2
  has_many :participant1s, :through => :meetings2, :source => :participant1
  
  #validates :first_name, :presence => true
  #validates :email, :uniqueness => true
  
  
end
