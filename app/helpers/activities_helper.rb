module ActivitiesHelper
  def list_helper(c, object)
    if object
      if !c.name.last
        ","
      end
    end
  end
end