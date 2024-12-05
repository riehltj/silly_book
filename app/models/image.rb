require "mini_magick"

class ImageProcessor
  def self.generate_blurry_placeholder(image_path)
    img = MiniMagick::Image.open(image_path)
    img = img.resize "20x20" # Resize the image to a small resolution
    img = img.blur("0x8")    # Apply blur to the small image
    img.write "path_to_blurry_placeholder.jpg" # Save or return the image
    img
  end
end