class RenameAttendeesToAttendeeLists < ActiveRecord::Migration[5.0]
  def change
    rename_table :attendees, :attendee_lists
  end
end
