module Recipes
  class Deploy < Base

    def initialize(pathfinder, type: 'none')
      if !%w(cloud66 docker none).include?(type)
        fail 'none, docker or cloud66 are the only allowed options for deploy recipe'
      end
      super(pathfinder)
      @type = type
    end

    def init_file
      case @type
      when 'docker' then docker_config_files
      when 'cloud66' then cloud66_config_files
      end
    end

    private

    def cloud66_config_files
      @template.add_file '.cloud66/bower.sh',
                         relative_file_content('deploy/cloud66/bower.sh')
      @template.add_file '.cloud66/cache_permissions.sh',
                         relative_file_content('deploy/cloud66/cache_permissions.sh')
      @template.add_file '.cloud66/deploy_hooks.yml',
                         relative_file_content('deploy/cloud66/deploy_hooks.yml')
    end

    def docker_config_files
      @template.add_file 'docker/rails-env.conf',
                         relative_file_content('deploy/docker/rails-env.conf')
      @template.add_file '.dockerignore',
                         relative_file_content('deploy/docker/.dockerignore')
      @template.append_file 'README.md',
                            relative_file_content('deploy/docker/README.md')
      add_file_and_replace_app_name('docker/fix_permissions.sh',
                                    'deploy/docker/fix_permissions.sh')
      add_file_and_replace_app_name('Dockerfile', 'deploy/docker/Dockerfile')
      add_file_and_replace_app_name('docker/nginx.conf', 'deploy/docker/nginx.conf')
    end

    def add_file_and_replace_app_name(target_file, source_file)
      @template.add_file target_file, relative_file_content(source_file)
      @template.run "sed -i '' 's/app-name/#{@pathfinder.app_name}/g' #{target_file}"
    end

  end
end
