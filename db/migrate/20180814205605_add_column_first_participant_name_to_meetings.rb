class AddColumnFirstParticipantNameToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :first_participant_name, :string
  end
end
