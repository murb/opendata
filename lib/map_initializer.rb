module MapInitializer
  def init_map
     @bouwplannen = Bouwplan.all
      @map = GMap.new("map_div")

      @map.control_init(:large_map => true,:map_type => false)
      @map.center_zoom_init([52.45,6.40],9)

      @gmarkers = []

    

      @totaal_bedrag = 0
      @totaal_bedrag_verwacht = 0


      @punten.each do | b |
        gm = GMarker.new([b.lat, b.lng], :title => "#{b.titel}", 
          :info_window => "<h3><a href=\"/putten/#{b.id}\">#{b.titel}<\\/a><\\/h4>")

        @map.overlay_init(gm)
         @gmarkers << gm
        @totaal_bedrag += b.geinvesteerd if b.geinvesteerd
        @totaal_bedrag_verwacht += b.verwachte_opbrengst if b.verwachte_opbrengst

       
      end
  end
end