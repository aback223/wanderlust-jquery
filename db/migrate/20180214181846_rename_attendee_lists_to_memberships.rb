class RenameAttendeeListsToMemberships < ActiveRecord::Migration[5.0]
  def change
    rename_table :attendee_lists, :memberships
  end
end
