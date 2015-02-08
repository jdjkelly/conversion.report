module TrackersHelper
  def can_create_tracker
    current_user.is_premium || current_user.trackers.empty?
  end
end
