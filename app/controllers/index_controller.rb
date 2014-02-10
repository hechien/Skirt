class IndexController < ApplicationController
  def index
    @url = Url.new
  end

  def goto
    target_url = Url.verify_code(params[:code]) || root_path
    redirect_to target_url
  end

  def create
    @url = Url.where({ url: url_params[:url] }).first_or_initialize
    @url.assign_attributes(url_params)
    @url.save

    render_url = "#{root_url}#{@url.code}"

    respond_to do |format|
      format.json { render json: { surl: render_url } }
    end
  end

  private
  def url_params
    params.require(:url).permit(:url)
  end
end
