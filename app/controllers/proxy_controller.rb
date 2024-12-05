# app/controllers/proxy_controller.rb
class ProxyController < ApplicationController
  require 'open-uri'

  def image
    url = params[:url]
    response = URI.open(url)
    image_data = response.read
    content_type = response.content_type

        render turbo_stream: turbo_stream.replace(
          "book_image_#{params[:id]}",
          partial: 'proxy/image',
          locals: { book_id: params[:id], image_data: image_data, content_type: content_type }
        )
  end
end