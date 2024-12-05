class CatalogsController < ApplicationController
  def index
    puts ">>> #{params}"
      @q = Catalog.ransack(params[:q])  # Initialize the Ransack search object
      @pagy, @catalogs = pagy(@q.result)  # Apply Pagy pagination
  end
end
