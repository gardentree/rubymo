class AppDelegate
  def application(application,didFinishLaunchingWithOptions: launchOptions)
    lambda {
      takeOffOptions = NSMutableDictionary.alloc.init
      takeOffOptions.setValue(launchOptions,forKey: UAirshipTakeOffOptionsLaunchOptionsKey)

      UAirship.takeOff(takeOffOptions)

      UAPush.shared.registerForRemoteNotificationTypes(UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound)
    }.call

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    sliding = ECSlidingViewController.alloc.init
    sliding.anchorRightPeekAmount = 40

    sliding.topViewController       = UINavigationController.alloc.initWithRootViewController(TopViewController.alloc.initWithSliding(sliding))
    sliding.underLeftViewController = UnderLeftViewController.alloc.init
    @window.rootViewController = sliding

    @window.makeKeyAndVisible

    true
  end

  def application(application,didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    UAPush.shared.registerDeviceToken(deviceToken)
  end

  def applicationWillTerminate(application)
    UAirship.land
  end
end
