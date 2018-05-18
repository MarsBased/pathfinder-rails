require_relative 'recipes'
require_relative 'configurators'
require 'tty-prompt'

class Pathfinder

  attr_reader :template, :app_name, :utils, :prompt

  def initialize(app_name, template)
    @app_name = app_name
    @template = template
    @utils = Recipes::Utils.new(@template)
    @prompt = TTY::Prompt.new
    @recipes_list = []
    @configurators_list = []
  end

  def ask_for_recipes
    add_recipe(Recipes::Database.new(self))
    add_recipe(Recipes::CarrierWave.new(self))
    add_recipe(Recipes::Mailgun.new(self))
    add_recipe(Recipes::Assets.new(self))
    add_recipe(Recipes::BootstrapDatepicker.new(self))
    add_recipe(Recipes::Devise.new(self))
    add_recipe(Recipes::Pundit.new(self))
    add_recipe(Recipes::GitIgnore.new(self))
    add_recipe(Recipes::Redis.new(self))
    add_recipe(Recipes::Sidekiq.new(self))
    add_recipe(Recipes::SimpleForm.new(self))
    add_recipe(Recipes::Status.new(self))
    add_recipe(Recipes::Webpacker.new(self))
    add_recipe(Recipes::Modernizr.new(self))
    add_recipe(Recipes::ActiveAdmin.new(self))
    add_recipe(Recipes::Testing.new(self))
    add_recipe(Recipes::Paranoia.new(self))
    add_recipe(Recipes::Ransack.new(self))
    add_recipe(Recipes::ElasticSearch.new(self))
  end

  def ask_for_configurators
    add_recipe_from_configurator(Configurators::Monitoring.new(self))
    add_configurator(Configurators::FormFramework.new(self))
  end

  def call
    ask_for_recipes
    ask_for_configurators
    @template.instance_exec(self) do |pathfinder|
      configuration = Recipes::Configuration.new(self)

      remove_file 'Gemfile'
      run 'touch Gemfile'
      add_source 'https://rubygems.org'

      append_file 'Gemfile',
        "ruby \'#{pathfinder.utils.ask_with_default('Which version of ruby do you want to use?', default: RUBY_VERSION)}\'"

      configuration.gems do
        pathfinder.generate_recipes_gems
        pathfinder.generate_configurators_gems
      end

      after_bundle do
        run 'spring stop'

        configuration.cook

        pathfinder.generate_recipes_initializers
      end
    end
  end

  def add_recipe(recipe)
    if recipe.ask?
      @recipes_list << recipe if recipe.ask!
    else
      @recipes_list << recipe
    end

    recipe
  end

  def add_configurator(configurator)
    @configurators_list << configurator
  end

  def add_recipe_from_configurator(configurator)
    recipe = configurator.recipe
    add_recipe(recipe) if recipe
  end

  def generate_configurators_gems
    configurators_operation(:cook)
  end

  def generate_recipes_gems
    recipes_operation(:gems)
  end

  def generate_recipes_initializers
    recipes_operation(:cook)
  end

  private

  def recipes_operation(method)
    @recipes_list.map(&method.to_sym)
  end

  def configurators_operation(method)
    @configurators_list.map(&method.to_sym)
  end

end
