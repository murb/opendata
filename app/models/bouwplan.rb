class Bouwplan < ActiveRecord::Base
  def self.xml
    Nokogiri::XML(File.open('data/bouwplan.xml'))
  end

  def self.load_xml
    self.xml.css('bouwplan').each do | bouwplan |
      b = Bouwplan.new()
      b.dossiernummer = bouwplan.css('dossiernummer').content
      b.locatieaanduiding = bouwplan.css('locatieaanduiding').content
      b.datum_indiening = bouwplan.css('datum_indiening').content
      b.postcode = bouwplan.css('postcode').content
      b.wijk = bouwplan.css('wijk').content
      b.omschrijving = bouwplan.css('omschrijving').content
      b.status = bouwplan.css('status').content
      b.datum_status = bouwplan.css('datum_status').content
      b.tekening = bouwplan.css('tekening').content
      b.save

    end
  end
end
