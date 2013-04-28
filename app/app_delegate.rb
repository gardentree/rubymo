class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    image   = UIImage.imageNamed('bg-menuitem.png')
    pressed = UIImage.imageNamed('bg-menuitem-hightlighted.png')
    star    = UIImage.imageNamed('icon-star.png')

    item1 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
    item2 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
    item3 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
    item4 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @menu = AwesomeMenu.alloc.initWithFrame(@window.bounds,menus: [item1,item2,item3,item4])
    @menu.delegate = self

    @menu.startPoint = CGPointMake(40.0, 430.0)
    @menu.menuWholeAngle = Math::PI * 0.625

    @window.addSubview(@menu)

    @window.makeKeyAndVisible

    true
  end
end
