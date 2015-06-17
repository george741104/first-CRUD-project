class EventgroupshipIndex < ActiveRecord::Migration
  def change
    add_index :event_groupships, :event_id
    add_index :event_groupships, :group_id
  end
end
