class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
    @user_posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user["id"]})
    else
    @posts = Post.where({ "place_id" => @place["id"]})
    end
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place.save
    else
      flash["notice"] = "Please Login First."
    end
      redirect_to "/places"
  end

end
