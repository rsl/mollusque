class SitesController < ApplicationController
  before_action :load_site, except: [:index, :create]

  def index
    @sites = Site.all
    respond_with @sites
  end

  def create
    @site = Site.create(site_params)
    respond_with @site
  end

  def show
    respond_with @site
  end

  def update
    @site.update site_params
    respond_with @site
  end

  def destroy
    @site.destroy
    respond_with @site
  end

private

  def load_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit :name
  end
end
