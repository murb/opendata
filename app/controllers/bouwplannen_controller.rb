class BouwplannenController < ApplicationController
  before_filter :require_user
  
  # GET /bouwplannen
  # GET /bouwplannen.xml
  def index
    
    @bouwplannen = Bouwplan.all
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([52.30,6.30],10)
    
    @gmarkers = []
    
    Bouwplan.all.each do | b |
            # 
            #       <td><%=bouwplan.datum_indiening%></td>
            # <td><%=bouwplan.dossiernummer%></td>
            # <td><%=bouwplan.locatieaanduiding%></td>
            #       <td><%=bouwplan.postcode%></td>
            #       <td><%=bouwplan.wijk%></td>
            #       <td><%=bouwplan.omschrijving%></td>
            #       <td><%=bouwplan.status%></td>
            #       <td><%=bouwplan.datum_status%></td>
            #       <td><%=bouwplan.tekening%></td>
      gm = GMarker.new([b.lat, b.lng], :title => "#{b.dossiernummer}", :info_window => "<h3>#{b.dossiernummer}</h3><p>#{b.omschrijving} in #{b.wijk} ingediend op #{b.datum_indiening}, <a href=\"#{b.tekening}\">tekening<\/a><\/p>")
      @map.overlay_init(gm)
      @gmarkers << gm
    end

    #render :text => @gmarkers.map{|m| m.inspect}
    
    respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @bouwplannen }
        end
  end

  # GET /bouwplannen/1
  # GET /bouwplannen/1.xml
  def show
    @bouwplan = Bouwplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bouwplan }
    end
  end

  # GET /bouwplannen/new
  # GET /bouwplannen/new.xml
  def new
    
    @bouwplan = Bouwplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bouwplan }
    end
  end

  # GET /bouwplannen/1/edit
  def edit
    @bouwplan = Bouwplan.find(params[:id])
  end

  # POST /bouwplannen
  # POST /bouwplannen.xml
  def create
    @bouwplan = Bouwplan.new(params[:bouwplan])

    respond_to do |format|
      if @bouwplan.save
        format.html { redirect_to(@bouwplan, :notice => 'Bouwplan was successfully created.') }
        format.xml  { render :xml => @bouwplan, :status => :created, :location => @bouwplan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bouwplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bouwplannen/1
  # PUT /bouwplannen/1.xml
  def update
    @bouwplan = Bouwplan.find(params[:id])

    respond_to do |format|
      if @bouwplan.update_attributes(params[:bouwplan])
        format.html { redirect_to(@bouwplan, :notice => 'Bouwplan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bouwplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bouwplannen/1
  # DELETE /bouwplannen/1.xml
  def destroy
    @bouwplan = Bouwplan.find(params[:id])
    @bouwplan.destroy

    respond_to do |format|
      format.html { redirect_to(bouwplannen_url) }
      format.xml  { head :ok }
    end
  end
end
