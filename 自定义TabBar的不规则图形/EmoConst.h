
// TabBar

#define TabBarItemImageRatio 0.8

#define TabBarHeight 48

#define ContentFrame CGRectMake(0,0,self.view.frame.size.width , self.view.frame.size.height - TabBarHeight)

#define DockFrame CGRectMake(0, self.view.frame.size.height-TabBarHeight, self.view.frame.size.width, TabBarHeight)

#define MiddleTabBarViewWidth 52
#define MiddleTabBarViewHeight 60
#define MiddleTabBarButtonWidth MiddleTabBarViewWidth
#define MiddleTabBarButtonHeight 58

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
