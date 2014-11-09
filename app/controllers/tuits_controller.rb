class TuitsController < ApplicationController
  TUITS_FILE = 'tuits'
  def index
    @tuits = if File.file?(TUITS_FILE)
      JSON.parse(File.read(TUITS_FILE))
    else
      {}
    end
  end

  def create
    file = File.read(TUITS_FILE)
    current_tuits = JSON.parse(file)
    current_tuits[params[:tuit]] = Time.now.to_i
    File.open(TUITS_FILE,"w") do |f|
      f.write(current_tuits.to_json)
    end
    redirect_to request.referer
  end
end
