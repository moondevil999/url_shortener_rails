class UrlController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new(count:0)
  end

  def create
    @url = Url.new(url_params)
    @url.count = 0
    p @url
    @url.save
    redirect_to url_index_path
  end


  def redirecting
    url = Url.find(params[:id])
    url.count += 1
    url.save
    redirect_to url.url
  end

  # def redirecting
  #   url = Url.where(kitly: params[:short_url]).first
  #   url.count += 1
  #   url.save
  #   redirect_to url.url
  # end

  private
  def url_params
    params.require(:url).permit(:url)
  end

end