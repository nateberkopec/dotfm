class HomeController < ApplicationController
  def index
    @tracks = $tracks.shuffle.first(200)
    @current_track = @tracks.first
  end
end
