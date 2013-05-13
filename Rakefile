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
  app.entitlements['aps-environment'] = 'development'

  app.frameworks += [
    'QuartzCore',
    'CFNetwork',
    'CoreGraphics',
    'Foundation',
    'MobileCoreServices',
    'Security',
    'SystemConfiguration',
    'UIKit',
    'libz.dylib',
    'libsqlite3.dylib',
    'CoreTelephony',
    'StoreKit',
    'CoreLocation',
    'MessageUI',
    'AudioToolbox',
    'MapKit',
  ]
  app.vendor_project('vendor/AwesomeMenu',:xcode)

  app.pods do
    pod 'ECSlidingViewController'
    pod 'UrbanAirship-iOS-SDK', '~> 1.4.0'
  end
end
