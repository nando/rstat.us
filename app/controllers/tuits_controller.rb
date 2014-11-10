class TuitsController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @tuits = Tuit.all
    respond_to do |format|
      format.html
      format.json { 
        headers['Access-Control-Allow-Origin'] = '*'
        render :json => @tuits.map{|t| {t.piido => t.updated_at.to_i}}
      }
    end
  end

  def create
    Tuit.create(:piido => params[:piido]) if params[:piido].present?
    redirect_to request.referer
  end
end
