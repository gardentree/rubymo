# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler/setup'
Bundler.require :default


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'rubymo'
  app.frameworks << "QuartzCore"

  app.vendor_project('vendor/AwesomeMenu',:xcode)

  app.pods do
    pod 'ECSlidingViewController'
  end
end
