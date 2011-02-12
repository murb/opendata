# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def als_geldbedrag getal
    return "€"+number_with_delimiter( @totaal_bedrag.to_i, delimiter=".")+",-"
  end
  
  def current_user_is_admin?
    return current_user.admin? if current_user
  end
end
