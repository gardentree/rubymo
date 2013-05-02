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
      @image = UIImageView.alloc.initWithImage(UIImage.imageNamed('Default.png'))
      view.addSubview(@image)
    }.call

    lambda {
      image   = UIImage.imageNamed('menu/bg-menuitem.png')
      pressed = UIImage.imageNamed('menu/bg-menuitem-hightlighted.png')
      star    = UIImage.imageNamed('menu/icon-star.png')

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

  def AwesomeMenu(menu,didSelectIndex: index)
    case index
    when 0
      sheet = UIActionSheet.alloc.initWithTitle(nil,delegate: self,cancelButtonTitle: 'Cancel',destructiveButtonTitle: nil,otherButtonTitles: 'Take Photo','Choose from Album',nil)
      sheet.showFromToolbar(navigationController.toolbar)
    when 1
    when 2
    when 3
    end
  end
  def actionSheet(sheet,clickedButtonAtIndex:index)
    callback = Proc.new {|result|
      @image.image = result[:original_image]
      @image.frame = self.view.frame;
    }

    case index
    when 0
      BW::Device.camera.rear.picture({media_types: [:image]},self,&callback)
    when 1
      BW::Device.camera.any.picture({media_types: [:image]},self,&callback)
    when sheet.cancelButtonIndex
      return
    end
  end

  def action_tapped
    @sliding.anchorTopViewTo ECRight
  end
end
