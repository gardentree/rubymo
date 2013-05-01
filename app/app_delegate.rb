class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    sliding = ECSlidingViewController.alloc.init
    sliding.anchorRightPeekAmount = 40

    sliding.topViewController       = UINavigationController.alloc.initWithRootViewController(TopViewController.alloc.initWithSliding(sliding))
    sliding.underLeftViewController = UnderLeftViewController.alloc.init
    @window.rootViewController = sliding

    @window.makeKeyAndVisible

    true
  end
end
