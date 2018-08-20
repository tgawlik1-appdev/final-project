class AddColumnSecondParticipantEmailToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :second_participant_email, :string
  end
end
