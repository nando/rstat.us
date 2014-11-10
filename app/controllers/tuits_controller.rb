class TuitsController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @tuits = Tuit.all
    respond_to do |format|
      format.html
      format.json { 
        render :json => @tuits.map{|t| {t.piido => t.updated_at.to_i}}
      }
    end
  end

  def create
    Tuit.create(:piido => params[:piido])
    redirect_to request.referer
  end
end
