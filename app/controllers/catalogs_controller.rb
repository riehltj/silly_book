class CatalogsController < ApplicationController
  def index
    @q = Catalog.ransack(params[:q])
    @pagy, @catalogs = pagy(@q.result(distinct: true), limit: 10)

    respond_to do |format|
      format.html # Standard HTML response
      format.turbo_stream # Turbo Stream response for infinite scroll
    end
  end
end
