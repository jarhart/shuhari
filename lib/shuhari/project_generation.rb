require 'thor'

module Shuhari
  module ProjectGeneration
    include Thor::Actions
    include PlatformGems

    protected

    def create_project
      template 'Gemfile.tt'
      copy_file 'Guardfile'
      setup_code
      template 'shuhari.yml.tt'
      template '.rvmrc.tt' if gemset
    end

    def setup_code
      inside('lib') { template 'kata.rb.tt', "#{snake_name}.rb" }
      inside(test_directory) { send :"setup_#{framework}" }
    end

    def setup_rspec
      template 'spec_helper.rb.tt'
      template 'kata_spec.rb.tt', "#{snake_name}_spec.rb"
    end

    def setup_minitest
      template 'test_helper.rb.tt'
      template 'test_kata.rb.tt', "test_#{snake_name}.rb"
    end

    def setup_testunit
      template 'test_helper.rb.tt'
      template 'kata_test.rb.tt', "#{snake_name}_test.rb"
    end

    def setup_cucumber
      inside('support') { template 'env.rb.tt' }
      directory 'step_definitions'
    end

    def clean_project
      ['lib', test_directory].each { |dir| remove_dir dir }
    end

    def test_directory
      case framework
      when 'rspec' then 'spec'
      when 'cucumber' then 'features'
      else 'test'
      end
    end
  end
end
