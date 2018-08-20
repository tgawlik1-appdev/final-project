class AddColumnYesParticipatingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :yes_participating, :boolean
  end
end
