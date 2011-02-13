class ContactMailsController < ApplicationController
  include MapInitializer
  before_filter :map_init


  def new
    init_map

     @contact_mail = ContactMail.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @contact_mail }
      end
    end

  # POST /contact_mails
  # POST /contact_mails.xml
  def create
    init_map
    
    @contact_mail = ContactMail.new(params[:contact_mail])

    respond_to do |format|
      contact = Contact.new
      if @contact_mail.save
        Contact.deliver_contact(@contact_mail)
        format.html { redirect_to('/', :notice => 'Bedankt voor uw bericht.') }
        format.xml  { render :xml => @contact_mail, :status => :created, :location => @contact_mail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_mail.errors, :status => :unprocessable_entity }
      end
    end
  end

private 
  def map_init
    @punten = Put.all
    init_map
    
  end
end
