# == Schema Information
#
# Table name: meetings
#
#  id                              :integer          not null, primary key
#  first_participant               :integer
#  second_participant              :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  meeting_date                    :date
#  first_participant_name          :string
#  second_participant_name         :string
#  first_participant_email         :string
#  second_participant_email        :string
#  second_participant_phone_number :string
#  first_participant_phone_number  :string
#

class Meeting < ApplicationRecord
    belongs_to :participant1, :class_name => "User", :foreign_key => "first_participant"
    belongs_to :participant2, :class_name => "User", :foreign_key => "second_participant"
    validates :first_participant, :presence => { :message => "Must have First Participant" }
    validates :first_participant, uniqueness: {scope: :second_participant, :message => "These people have already met" }
    validates :second_participant, :presence => { :message => "Must have Second Participant" }
    validates :second_participant, uniqueness: {scope: :first_participant, :message => "These people have already met" }
end
