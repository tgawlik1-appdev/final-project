class AddColumnSecondParticipantNameToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :second_participant_name, :string
  end
end
