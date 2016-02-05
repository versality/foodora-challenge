class GifsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Pagination is apparently ideal here, but was out of scope of the challenge
    @gifs = Gif.all
  end

  def create
    gif = Gif.new(gifs_params)

    # Would be expanded into more rich error reporting in real project
    if gif.save
      render json: nil, status: :ok
    elsif
      render json: false, status: :bad_request
    end
  end

  def search
    giphy_search = Giphy::Search.new
    @gifs        = giphy_search.by_title(gifs_search_params[:q])

    if request.xhr?
      render layout: false
    else
      render nothing: true, status: 404, layout: false
    end
  end

  private
  def gifs_params
    params.require(:gifs).permit(:uid, :tags)
  end

  def gifs_search_params
    params.require(:gifs).permit(:q)
  end
end
