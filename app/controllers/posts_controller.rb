class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new
      @post["title"] = params["post"]["title"]
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post["place_id"] = params["post"]["place_id"]
      @post["user_id"] = @current_user["id"]
      @post.save
    else
      flash["notice"] = "Please Login First."
    end
    redirect_to "/places/#{@post["place_id"]}"
  end

end
