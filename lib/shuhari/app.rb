require 'thor'
require 'shuhari'

module Shuhari
  class App < Thor
    include Thor::Actions
    include ProjectGeneration

    desc 'new [NAME]', 'create a new Kata project'

    method_option :rspec, :type => :boolean, :aliases => '-r',
      :desc => 'test using RSpec', :default => true

    method_option :minitest, :type => :boolean, :aliases => '-m',
      :desc => 'test using minitest'

    method_option :testunit, :type => :boolean, :aliases => '-t',
      :desc => 'test using Test::Unit'

    method_option :cucumber, :type => :boolean, :aliases => '-c',
      :desc => 'test using Cucumber'

    if Platform.unix?
      method_option :gemset, :type => :boolean, :aliases => '-g',
        :desc => 'install gems in a gemset and create .rvmrc'
    end

    def new(name=nil)
      @name = name || ask('Project Name:')
      setup_source_paths
      inside snake_name, :verbose => true do
        self.destination_root = '.'
        create_project
      end
    end

    desc 'empty', 'restart the Kata with empty mind and project'
    def empty
      @name = load_setting(:project_name)
      @framework = load_setting(:test_framework)
      clean_project
      setup_source_paths
      setup_code
    end

    protected

    def load_setting(name)
      require 'yaml'
      @settings ||= YAML.load_file('shuhari.yml')
      @settings[name.to_s] or raise Thor::Error, "#{name} missing from shuhari.yml"
    end

    def setup_source_paths
      ['base', framework].each do |sub|
        source_paths << File.join(PROJECT_ROOT, 'templates', sub)
      end
    end

    attr_accessor :name

    def camel_name
      @camel_name ||= Util.camel_case(name)
    end

    def snake_name
      @snake_name ||= Util.snake_case(name)
    end

    def framework
      @framework ||=
        %w( minitest testunit cucumber rspec ).find { |f| options[f.to_sym] }
    end

    def gemset
      options[:gemset] && "#{snake_name}_kata"
    end
  end
end
