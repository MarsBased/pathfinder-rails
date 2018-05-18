module Configurators
  class ImageMagick < Base

    askable 'Are you going to handle images with CarrierWave?'
    dependable 'Recipes::CarrierWave'
    is_confirmable

    def cook
      if ask!
        @template.gem 'mini_magick'
      end
    end

  end
end
