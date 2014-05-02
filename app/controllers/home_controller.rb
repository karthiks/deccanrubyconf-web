class HomeController < ApplicationController

  def index
    render
  end

  def landing
    render 'landing', layout: false
  end
end
