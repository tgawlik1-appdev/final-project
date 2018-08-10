class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.integer :first_participant
      t.integer :second_participant

      t.timestamps
    end
  end
end
