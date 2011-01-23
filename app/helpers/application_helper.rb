# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def als_geldbedrag getal
    return "€"+number_with_delimiter( @totaal_bedrag.to_i, delimiter=".")+",-"
  end
end
