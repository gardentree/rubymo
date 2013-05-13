# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler/setup'
Bundler.require :default

config = YAML::load_file('config.yml')

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'rubymo'
  app.identifier            = config['identifier']
  app.provisioning_profile  = config['development']['provisioning']

  app.frameworks << "QuartzCore"
  app.vendor_project('vendor/AwesomeMenu',:xcode)

  app.pods do
    pod 'ECSlidingViewController'
  end
end
