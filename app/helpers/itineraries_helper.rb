module ItinerariesHelper
  def itinerary_belongs_to_user(user)
    @itinerary.users.include?(user)
  end
end