class PagesController < ApplicationController
	
	layout 'fluid'

  def home
  	@services = Service.all
  end


end
