module Recipes
  class Database < Base

    is_auto_runnable

    def gems
      case @template.options.database
      when 'postgresql'
        @template.gem 'pg', '~> 0.18'
      when 'mysql'
        @template.gem 'mysql2', '>= 0.3.18'
      else
        @template.gem 'sqlite3'
      end
    end

    def cook
      @template.rake 'db:create'
    end

  end
end
