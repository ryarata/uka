class HomeController < ApplicationController
  def index
  	@competitions = Competition.all
  	@presentations = Presentation.all
  end
end
