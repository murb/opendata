class Put < ActiveRecord::Base
  acts_as_mappable
  
  include GeoKit::Geocoders
  
  
  def geocode_address
    address = "Nederland, Overijssel, #{locatie}"
    geo=GeoKit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:address, "Kon de locatie helaas niet zelf plaatsen, probeer zelf de coordinaten op te geven") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
  
  
  def to_param
    "#{id}-#{titel.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
end
