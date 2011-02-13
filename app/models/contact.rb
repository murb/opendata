class Contact < ActionMailer::Base
  

  def contact(params, sent_at = Time.now )
    Contact.smtp_settings=ActionMailerCredentials.first
    
    subject    "[blp.nl] #{params.onderwerp}"
    recipients 'info@bodemlozeputten.nl'
    reply_to   params.email
    #from       'formulier@bodemlozeputten.nl'
    sent_on    sent_at
    from      'ramshacklemurb@gmail.com'
    body       :params => params
  end

end
