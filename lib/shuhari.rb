module Shuhari

  PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__))

  autoload :App, 'shuhari/app'
  autoload :Platform, 'shuhari/platform'
  autoload :PlatformGems, 'shuhari/platform_gems'
  autoload :ProjectGeneration, 'shuhari/project_generation'
end
