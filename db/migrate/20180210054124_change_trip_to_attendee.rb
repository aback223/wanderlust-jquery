class ChangeTripToAttendee < ActiveRecord::Migration[5.0]
  def change
    rename_table :trips, :attendees
  end
end
