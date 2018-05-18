module Configurators
  class ImageMagick < Base

    askable 'Are you going to handle images with CarrierWave?'
    dependable 'Recipes::CarrierWave'
    confirmable true

    def cook
      if ask!
        @template.gem 'mini_magick'
      end
    end

  end
end
