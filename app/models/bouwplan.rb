class Bouwplan < ActiveRecord::Base
  #acts_as_mappable
  include GeoKit::Geocoders
  
  def titel 
    dossiernummer
  end
  
  def omschrijving
    "<p>#{self.omschrijving} in #{self.wijk} ingediend op #{self.datum_indiening}, <a href=\"#{self.tekening}\">tekening</a></p>"
  end
      
  def self.xml
    Nokogiri::XML(File.open('data/bouwplan.xml'))
  end
  
  def self.load_xml
    self.xml.css('bouwplan').each do | bouwplan |
      b = Bouwplan.new()
      b.dossiernummer = bouwplan.css('dossiernummer').text
      b.locatieaanduiding = bouwplan.css('locatieaanduiding').text
      datum_indiening = bouwplan.css('datum_indiening').text.split("/")
      b.datum_indiening = "#{datum_indiening[2]}-#{datum_indiening[1]}-#{datum_indiening[0]}"
      b.postcode = bouwplan.css('postcode').text
      b.wijk = bouwplan.css('wijk').text
      b.omschrijving = bouwplan.css('omschrijving').text
      b.status = bouwplan.css('status').text
      datum_status = bouwplan.css('datum_status').text.split("/")
      b.datum_status = "#{datum_status[2]}-#{datum_status[1]}-#{datum_status[0]}"
      b.tekening = bouwplan.css('tekening').text
      b.geocode_address!
      b.save
    end
  end
  
  def geocode_address!
    address = "Nederland, #{postcode}, Enschede, #{locatieaanduiding}"
    geo=GeoKit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
    self.save!
  end
end
