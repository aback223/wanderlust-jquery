module ActivitiesHelper
  def list_helper(category, activity)
    if category != activity.categories.last
      ","
    end
  end
end