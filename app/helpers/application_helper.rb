# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def als_geldbedrag getal
    
    if getal.round > 700000
      getal = (getal / 100000.0).round / 10.0
      getal = number_with_delimiter(getal, :separator=>",")
      getal = "#{getal} miljoen"
    else 
      getal = number_with_delimiter( getal.round, delimiter=".")
      getal = "#{getal},-"
    end
    return "€"+getal
  end
  
  def current_user_is_admin?
    return current_user.admin? if current_user
  end
end
