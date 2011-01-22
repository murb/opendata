class Put < ActiveRecord::Base
  acts_as_mappable
  
  include GeoKit::Geocoders
  
end
