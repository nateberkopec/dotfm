class HomeController < ApplicationController
  def index
    @tracks = $tracks.shuffle.first(200)
  end
end
