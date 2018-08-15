class AddColumnFirstParticipantEmailToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :first_participant_email, :string
  end
end
