class TuitsController < ApplicationController
  protect_from_forgery :except => :create

  def index
    @tuits = Tuit.all
    respond_to do |format|
      format.html
      format.json { 
        headers['Access-Control-Allow-Origin'] = '*'
        render :json => {}.tap{|hash|
          @tuits.each do |tuit|
            hash[tuit.piido] = tuit.updated_at.to_i
          end
        }
      }
    end
  end

  def create
    Tuit.create(:piido => params[:piido]) if params[:piido].present?
    redirect_to request.referer
  end
end
