class EventActivity < ActiveRecord::Base
  belongs_to :event
  belongs_to :activity
  validates :activity_id, :uniqueness => {:scope => :event_id}

  after_destroy :destroy_vacant_activity

  def destroy_vacant_activity
    if self.activity.event_activities.count == 0
      self.activity.destroy
    end
  end
end
