module Recipes
  class ElasticSearch < Base

    askable 'Are you going to use ElasticSearch?'
    confirmable true

    def gems
      @template.gem 'searchkick'
    end

  end
end
