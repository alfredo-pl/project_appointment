class LandingController < ApplicationController
  def index
    @businesses = Business.all
  end
end
