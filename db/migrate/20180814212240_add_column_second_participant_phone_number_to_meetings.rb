class AddColumnSecondParticipantPhoneNumberToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :second_participant_phone_number, :string
  end
end
