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
#  latitude               :float
#  longitude              :float
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

#require "open-uri"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  # after_validation :street_to_coords
  
  # def street_to_coords
    
  #   @street_address = self.full_daytime_address
    
  #   url_safe_street_address = URI.encode(@street_address)
    
  #   raw_data = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
  #   parsed_data = JSON.parse(open(raw_data).read)
  #   # binding.pry
  #   self.assign_attributes(:latitude => parsed_data.dig("results", 0, "geometry", "location", "lat"))
    
  #   self.assign_attributes(:longitude => parsed_data.dig("results", 0, "geometry", "location", "lng"))
  # end
 
  has_many :meetings1, :class_name => "Meeting", :foreign_key => "first_participant"
  has_many :meetings2, :class_name => "Meeting", :foreign_key => "second_participant"
  has_many :participant2s, :through => :meetings1, :source => :participant2
  has_many :participant1s, :through => :meetings2, :source => :participant1
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  #validates :phone_number, :presence => true
  validates :network_affiliation, :presence => true
  #validates :full_daytime_address, :presence => true
  validates :email, :uniqueness => true
  
  
end
