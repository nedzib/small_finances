class HomeController < ApplicationController
  def index
    @months = active_group.months
  end
end
