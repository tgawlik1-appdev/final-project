# == Schema Information
#
# Table name: meetings
#
#  id                 :integer          not null, primary key
#  first_participant  :integer
#  second_participant :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Meeting < ApplicationRecord
    belongs_to :participant1, :class_name => "User", :foreign_key => "first_participant"
    belongs_to :participant2, :class_name => "User", :foreign_key => "second_participant"
    validates :first_participant, :presence => { :message => "Must have First Participant" }
    validates :first_participant, :uniqueness => true
    validates :second_participant, :presence => { :message => "Must have Second Participant" }
    validates :second_participant, :uniqueness => true
end
