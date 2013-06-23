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
      options = ask_rspec_options
      gsub_file '../Guardfile', /(?<=cli\: \")/, "--#{options.join(" --")}" if options
      template 'spec_helper.rb.tt'
      template 'kata_spec.rb.tt', "#{snake_name}_spec.rb"
    end

    def setup_minitest
      template 'test_helper.rb.tt'
      template 'test_kata.rb.tt', "test_#{snake_name}.rb"
    end

    alias_method :setup_minitest_spec, :setup_rspec

    def setup_testunit
      template 'test_helper.rb.tt'
      template 'kata_test.rb.tt', "#{snake_name}_test.rb"
    end

    def setup_cucumber
      inside('support') { template 'env.rb.tt' }
      directory 'step_definitions'
      template 'kata.feature.tt', "#{snake_name}.feature"
    end

    def clean_project
      ['lib', test_directory].each { |dir| remove_dir dir }
    end

    def test_directory
      case framework
      when 'rspec', 'minitest_spec' then 'spec'
      when 'cucumber' then 'features'
      else 'test'
      end
    end

    def ask_rspec_options
      options = []
      if yes?("Would you like to add options?")
        options.push("color") if yes?("Would you like color?")
        options.push("format=doc") if yes?("Would you like to see documentation?")
        options.push("backtrace") if yes?("Would you like to see a backtrace?")
      end
      options unless options.empty?
    end
  end
end
