class PuttenController < ApplicationController
  # GET /putten
  # GET /putten.xml
  def index
    @putten = Put.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @putten }
    end
  end

  # GET /putten/1
  # GET /putten/1.xml
  def show
    @put = Put.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @put }
    end
  end

  # GET /putten/new
  # GET /putten/new.xml
  def new
    @put = Put.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @put }
    end
  end

  # GET /putten/1/edit
  def edit
    @put = Put.find(params[:id])
  end

  # POST /putten
  # POST /putten.xml
  def create
    @put = Put.new(params[:put])

    respond_to do |format|
      if @put.save
        format.html { redirect_to(@put, :notice => 'Put was successfully created.') }
        format.xml  { render :xml => @put, :status => :created, :location => @put }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @put.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /putten/1
  # PUT /putten/1.xml
  def update
    @put = Put.find(params[:id])

    respond_to do |format|
      if @put.update_attributes(params[:put])
        format.html { redirect_to(@put, :notice => 'Put was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @put.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /putten/1
  # DELETE /putten/1.xml
  def destroy
    @put = Put.find(params[:id])
    @put.destroy

    respond_to do |format|
      format.html { redirect_to(putten_url) }
      format.xml  { head :ok }
    end
  end
end
