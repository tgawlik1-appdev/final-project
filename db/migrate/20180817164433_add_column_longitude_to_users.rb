class AddColumnLongitudeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :longitude, :float
  end
end