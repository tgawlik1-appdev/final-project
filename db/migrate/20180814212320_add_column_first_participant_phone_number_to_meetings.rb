class AddColumnFirstParticipantPhoneNumberToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :first_participant_phone_number, :string
  end
end
