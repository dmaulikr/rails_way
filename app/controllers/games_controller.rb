class GamesController < ApplicationController
  def show
    @images = Dir[Rails.root.join 'app', 'assets', 'images', 'railsroads', '*'].map do |file|
      "railsroads/#{file.split('/').last}"
    end.take(4)
  end
end
