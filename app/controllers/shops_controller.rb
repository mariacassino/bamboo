class ShopsController < ApplicationController

  def index
  end

  def import
    # TODO #needs to be moved to shops show page
    file = params[:file]
    CSV.foreach(file.path, headers: true) do |row|
      #Create objects here from each row
      row
    end
  end

  def test
  end

end
