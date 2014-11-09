class TuitsController < ApplicationController
  TUITS_FILE = 'tuits'
  def index
    @tuits = Tuit.all
  end

  def create
    Tuit.create(:text => params[:tuit])
    redirect_to request.referer
  end
end
