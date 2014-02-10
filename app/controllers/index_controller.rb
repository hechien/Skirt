class IndexController < ApplicationController
  def index
    @url = Url.new
  end

  def goto
    target_url = Url.verify_code(params[:code]) || root_path
    redirect_to target_url
  end

  def create
    @url = Url.new(url_params)

    if Url.where(:url=> @url.url).count > 0
      @render_url = root_url + Url.where(:url=> @url.url).first.code
    elsif @url.save
      @render_url = root_url + @url.code
    else
      @render_url = @url.url
    end

    respond_to do |format|
      format.json { render :json => {:surl => @render_url }}
    end
  end

  private
  def url_params
    params.require(:url).permit(:url)
  end
end
