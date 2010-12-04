class BouwplansController < ApplicationController
  # GET /bouwplans
  # GET /bouwplans.xml
  def index
    @bouwplans = Bouwplan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bouwplans }
    end
  end

  # GET /bouwplans/1
  # GET /bouwplans/1.xml
  def show
    @bouwplan = Bouwplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bouwplan }
    end
  end

  # GET /bouwplans/new
  # GET /bouwplans/new.xml
  def new
    @bouwplan = Bouwplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bouwplan }
    end
  end

  # GET /bouwplans/1/edit
  def edit
    @bouwplan = Bouwplan.find(params[:id])
  end

  # POST /bouwplans
  # POST /bouwplans.xml
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

  # PUT /bouwplans/1
  # PUT /bouwplans/1.xml
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

  # DELETE /bouwplans/1
  # DELETE /bouwplans/1.xml
  def destroy
    @bouwplan = Bouwplan.find(params[:id])
    @bouwplan.destroy

    respond_to do |format|
      format.html { redirect_to(bouwplans_url) }
      format.xml  { head :ok }
    end
  end
end
