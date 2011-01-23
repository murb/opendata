class PuntenController < ApplicationController
  include MapInitializer
  def index
    @punten = Put.all
    @punten += Bouwplan.all
    init_map
    
  end
end
