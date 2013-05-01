class TopViewController < UIViewController
  def initWithSliding(sliding)
    @sliding = sliding

    self
  end

  def viewDidLoad
    lambda {
      action_button = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemBookmarks, target:self, action:'action_tapped')
      navigationItem.title = 'rubymo'
      navigationItem.leftBarButtonItem = action_button
    }.call

    lambda {
      image   = UIImage.imageNamed('bg-menuitem.png')
      pressed = UIImage.imageNamed('bg-menuitem-hightlighted.png')
      star    = UIImage.imageNamed('icon-star.png')

      item1 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
      item2 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
      item3 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)
      item4 = AwesomeMenuItem.alloc.initWithImage(image,highlightedImage: pressed,ContentImage: star,highlightedContentImage: nil)

      menu = AwesomeMenu.alloc.initWithFrame(UIScreen.mainScreen.bounds,menus: [item1,item2,item3,item4])
      menu.delegate = self
      menu.startPoint = CGPointMake(40.0, 360.0)
      menu.menuWholeAngle = Math::PI * 0.625

      view.addSubview(menu)
    }.call

    # self.view.backgroundColor = UIColor.blueColor
  end

  def action_tapped
    @sliding.anchorTopViewTo ECRight
  end
end
