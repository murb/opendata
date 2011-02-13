module PuntenHelper
  def opsomming punten
    optesommen = []
    punten.each do |p| 
  	  optesommen.push(link_to(p.titel,p)) 
    end
    optesommen.join(", ").reverse.sub(" ,", " ne ").reverse
  end
end
