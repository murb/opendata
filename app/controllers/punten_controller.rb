class PuntenController < ApplicationController
  
  def index
    
    @bouwplannen = Bouwplan.all
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([52.40,6.40],9)
    
    @gmarkers = []
    
    @punten = Put.all
    @punten += Bouwplan.all
    
    @totaal_bedrag = 0
    @totaal_bedrag_verwacht = 0
    
    
    @punten.each do | b |
      gm = GMarker.new([b.lat, b.lng], :title => "#{b.titel}", :info_window => "<h3>#{b.titel}<\\/h3><div class=\"omschrijving\">#{b.omschrijving}<\\/div><div class=\"actions\"><a href=\"#\">Meer informatie<\\/a><\\/div>".gsub!("/","\/"))
      @map.overlay_init(gm)
      @totaal_bedrag += b.geinvesteerd if b.geinvesteerd
      @totaal_bedrag_verwacht += b.verwachte_opbrengst if b.verwachte_opbrengst
      
      @gmarkers << gm
    end
    
    
  end
  

end
