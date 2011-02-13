class ContactController < ApplicationController
  
  def create
    init_map
    
    respond_to do |format|
      if contact.contact
        format.html { redirect_to('/', :notice => 'Mail send') }
        format.xml  { render :xml => 'send', :status => :created, :location => @put }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => "not send", :status => :unprocessable_entity }
      end
    end
  end

end