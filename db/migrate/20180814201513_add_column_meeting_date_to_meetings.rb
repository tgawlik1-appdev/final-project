class AddColumnMeetingDateToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :meeting_date, :date
  end
end
