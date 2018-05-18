module Recipes
  class ElasticSearch < Base

    is_auto_runnable

    askable 'Are you going to use ElasticSearch?'
    is_confirmable

    def gems
      @template.gem 'searchkick'
    end

  end
end
